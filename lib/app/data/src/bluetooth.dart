import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';


class BluetoothException implements Exception {}

class Bluetooth {

  final List<Region> _regions = [
    Region(
      identifier: 'IBeacon',
      proximityUUID: 'fda50693-a4e2-4fb1-afcf-c6eb07647825',
    )
  ];


  Future<bool> initialize() async {
    try {
      return flutterBeacon.initializeAndCheckScanning;
    } on PlatformException {
      throw BluetoothException();
    }
  }


  Future<List<Beacon>> getBeaconsAsync() async {
    try {
      return (await flutterBeacon.ranging(_regions).first).beacons;
    } catch (e) {
      throw BluetoothException();
    }
  }

  Stream<List<Beacon>> getBeaconsStream() {
    try {
      return flutterBeacon.ranging(_regions).map((event) => event.beacons);
    } catch (e) {
      throw BluetoothException();
    }
  }
  
}
