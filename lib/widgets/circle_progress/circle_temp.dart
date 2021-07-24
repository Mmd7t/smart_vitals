import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/read_data/glucose_create_model.dart';
import 'package:smart_vitans/providers/device_provider.dart';
import 'package:smart_vitans/services/read_data_services.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import '../../themes.dart';
import '../Gradient_text.dart';
import '../animated_Text.dart';
import 'radial_pointer.dart';

class RadialProgressTemp extends StatefulWidget {
  const RadialProgressTemp({
    Key key,
    this.value,
    this.duration,
    this.size,
    this.figure,
    this.advice,
    this.condition,
    this.figureH,
    this.figureW,
  }) : super(key: key);

  final double goalCompleted = 1;
  final String value;
  final int duration;
  final Size size;
  final String figure;
  final String advice;
  final String condition;
  final double figureH;
  final double figureW;

  @override
  _RadialProgressTempState createState() => _RadialProgressTempState();
}

class _Message {
  int whom = 1;
  String text = '';

  _Message(this.whom, this.text);
}

class _RadialProgressTempState extends State<RadialProgressTemp>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(microseconds: 0);

  double progressDegrees = 0;

  static final clientID = 0;
  BluetoothConnection connection;

  // List<_Message> messages = [];
  _Message messageBlue = _Message(1, '');
  String _messageBuffer = '';

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  void _onDataReceived(Uint8List data) {
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      setState(() {
        messageBlue = _Message(
          1,
          backspacesCounter > 0
              ? _messageBuffer
                  .substring(0, _messageBuffer.length - backspacesCounter)
                  .trim()
              : _messageBuffer + dataString.substring(0, index).trim(),
        );
        // setState(() {
        //   messages.add(_Message(
        //     1,
        //     backspacesCounter > 0
        //         ? _messageBuffer
        //             .substring(0, _messageBuffer.length - backspacesCounter)
        //             .trim()
        //         : _messageBuffer + dataString.substring(0, index).trim(),
        //   ));
        // });
        _messageBuffer = dataString.substring(index);
      });
    } else {
      _messageBuffer = (backspacesCounter > 0
              ? _messageBuffer.substring(
                  0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer + dataString)
          .trim();

      // messageBlue = _Message(1, _messageBuffer);
    }
  }

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.duration));
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });
    var deviceId = Provider.of<DeviceProvider>(context, listen: false);
    BluetoothConnection.toAddress(deviceId.device.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input.listen(_onDataReceived).onDone(() {
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text));
        await connection.output.allSent;

        // setState(() {
        //   messages.map((e) {
        //     e = _Message(clientID, text);
        //   });

        //   messages.forEach((element) {
        //     element = _Message(clientID, text);
        //   });
        // });

        Future.delayed(Duration(milliseconds: 333));
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    setState(() {
      if (progressDegrees == 0) {
        child = Center(
          child: InkWell(
            highlightColor: AppColors.cdarkwhite,
            splashColor: AppColors.cdarkwhite,
            onTap: () async {
              _radialProgressAnimationController.forward();
              await _sendMessage('3');
              /*-------------------------------------------------------------------------------*/
              /*---------------------------  Post Data To DataBase  ---------------------------*/
              /*-------------------------------------------------------------------------------*/
              ReadDataServices.temperatureCreate(GlucoseHeartTempCreate(
                  patientId: Constants.userId,
                  value: int.parse(messageBlue.text)));
            },
            child: GradientText(
              text: "Measure",
              font: AppFonts.precentage,
            ),
          ),
        );
      } else if (progressDegrees == 360) {
        child = Center(
          child: InkWell(
            highlightColor: AppColors.cdarkwhite,
            onTap: () {
              // messages.clear();
              setState(() {
                progressDegrees = 0;
                _radialProgressAnimationController.reset();
              });
            },
            child: GradientText(
              text: widget.value,
              font: AppFonts.precentage,
            ),
          ),
        );
      } else {
        child = Lottie.asset('assets/animation/animation.json', repeat: true);
      }
    });

    return Column(
      children: [
        CustomPaint(
          child: Container(
              height: widget.size.width * 0.4,
              width: widget.size.width * 0.4,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: child),
          painter: RadialPainter(progressDegrees),
        ),
        if (progressDegrees == 360)
          AnmitedWidget(
            size: widget.size,
            figure: widget.figure,
            condition: widget.condition,
            advice: widget.advice,
            figureH: widget.figureH,
            figureW: widget.figureW,
          ),
      ],
    );
  }
}
