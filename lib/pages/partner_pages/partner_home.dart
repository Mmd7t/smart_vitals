import 'package:flutter/material.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Glucose_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Oxgyen_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Tempreture_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/heart_rate_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/pressure_mrasurment.dart';
import 'package:smart_vitans/pages/common_pages/addservicies.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/Tempreture.dart';
import 'package:smart_vitans/pages/patient_pages/components/BoxButton.dart';
import 'package:smart_vitans/pages/patient_pages/components/Title_Box.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import '../../themes.dart';

class PartnerHome extends StatefulWidget {
  @override
  _PartnerHomeState createState() => _PartnerHomeState();
}

class _PartnerHomeState extends State<PartnerHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List buttons = [
      ['Blood Preasure', 'blood-pressure', PressureMeasure()],
      ['Oxgyen', 'oxygen-tank', OxygenMeasure()],
      ['Heart Rate', 'heart-rate-monitor', HeartRateMeasure()],
      ['Glocuse', 'glucometer', GlucoseMeasure()],
      ['Tempreature', 'thermometer', TempMeasure()],
      ['patient history', 'parchment', AddServicies(type: 0)],
      ['Additional services', 'plus', AddServicies(type: 1)],
    ];
    return Scaffold(
        backgroundColor: const Color(0xFFF0F8FA),
        body: Column(
          children: [
            Container(
              height: (size.height / 8) + 20,
              child: Stack(
                children: [
                  GradientBox(
                    size: size.height / 8,
                    radius: 56.0,
                  ),
                  Positioned(
                    top: size.height / 13,
                    left: size.width * 0.1,
                    child: Text(
                      'My patient',
                      style:
                          AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.05,
                    top: (size.height / 3) - 10,
                    child: TitleBox(size: size),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Wrap(
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runSpacing: 10,
              spacing: 12,
              children: List.generate(
                buttons.length,
                (index) => GradientBoarder(
                  widget: BoxButton(
                    size: size,
                    buttom: buttons[index],
                    width: size.width * 0.28,
                    height: size.width * 0.28,
                  ),
                  width: size.width * 0.28,
                  height: size.width * 0.28,
                  rad: 30,
                  size: size,
                  offesetX: 3,
                  offesetY: 3,
                  blur: 5,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.alarm),
          onPressed: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => Medication()));
          },
        ));
  }
}
