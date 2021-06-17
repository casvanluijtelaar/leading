import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

/// for the simplicity of this application we don't need to distinguish between
/// every excepton the [Bluetooth] class can throw, therefor we generalize it
/// to this [BluetoothException]
class BluetoothException implements Exception {}

/// wrapper class handeling all the flutter_beacon plugin interactions
class Bluetooth {
  /// flutter_beacon can scan multiple ble regions at the same time. this
  /// application currently only uses one beacon type setup with the same
  /// uuid. so we can store the scanable regions as a constant value
  final List<Region> _regions = [
    Region(
      identifier: 'IBeacon',
      proximityUUID: 'fda50693-a4e2-4fb1-afcf-c6eb07647825',
    )
  ];

  /// flutter_beacon needs to be initialised before use, this includes
  /// checking permissions and bluetooth / location availability.
  /// 
  /// returns `true` if initialisation is succesfull
  /// might throw [BluetoothException]
  Future<bool> initialize() {
    try {
      return flutterBeacon.initializeAndCheckScanning;
    } on PlatformException {
      throw BluetoothException();
    }
  }

  /// returns the first [List<Beacon>] returned from the flutter_beacon
  /// ranging stream, can throw [BluetoothException]
  Future<List<Beacon>> getBeaconsAsync() async {
    try {
      return (await flutterBeacon.ranging(_regions).first).beacons;
    } catch (e) {
      throw BluetoothException();
    }
  }

  /// returns a stream of [Beacon] received during ranging the [_regions] 
  Stream<List<Beacon>> getBeaconsStream() {
    try {
      return flutterBeacon.ranging(_regions).map((event) => event.beacons);
    } catch (e) {
      throw BluetoothException();
    }
  }
}
