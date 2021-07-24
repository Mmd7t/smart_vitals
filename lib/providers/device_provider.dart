import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceProvider extends ChangeNotifier {
  BluetoothDevice _device = BluetoothDevice(address: '');

  BluetoothDevice get device => _device;

  void setDevice(device) {
    _device = device;
    notifyListeners();
  }
}
