import 'package:flutter_beacon/flutter_beacon.dart';

abstract class BluetoothContract {
  Future<void> initialize();

  Future<List<Beacon>> getBeaconsAsync();

  Stream<List<Beacon>> getBeaconsStream();
}
