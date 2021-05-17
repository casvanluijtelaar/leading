import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class BluetoothExeption implements Exception {
  const BluetoothExeption(this.exception, this.trace);

  final Exception exception;
  final StackTrace trace;
}

/// wrapper class that handles all the interactions with the flutter_beacon
/// package
class Bluetooth {

  /// the list of BLE regions we should check for beacons in
  final List<Region> _regions = [
    Region(
      identifier: 'identifier',
      proximityUUID: '',
    )
  ];

  /// attemps to initialize the bluetoothbeacon library and check permissions
  /// if not a [BluetoothExeption] will be thrown
  Future<void> initialize() {
    try {
      return flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e, s) {
      throw BluetoothExeption(e, s);
    }
  }

  /// returns the first found beacons, can throw [BluetoothExeption]
  Future<List<Beacon>> getBeaconsAsync() async {
    try {
      final result = await flutterBeacon.ranging(_regions).first;
      return result.beacons;
    } catch (e, s) {
      throw BluetoothExeption(e as Exception, s);
    }
  }

  /// returns a stream of bluetooth beacons that fires every time a new beacon
  /// has been detected. can throw [BluetoothExeption]
  Stream<List<Beacon>> getBeaconsStream() {
    try {
      return flutterBeacon.ranging(_regions).map((e) => e.beacons);
    } catch (e, s) {
      throw BluetoothExeption(e as Exception, s);
    }
  }
}
