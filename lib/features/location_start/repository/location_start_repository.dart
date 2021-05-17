import 'package:flutter_beacon/flutter_beacon.dart';

import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/app/data/utils/extensions.dart';

class LocationNotFoundException implements Exception {}

class LocationStartRepository {
  const LocationStartRepository(this._bluetooth, this._database);

  final Bluetooth _bluetooth;
  final Database _database;

  /// attempts to find the closest [Location] can throw:
  /// * BluetoothException: something went wrong retrieving the BLE beacons
  /// * LocationNotFoundException: no location was found
  Future<Location> getLocation() async {
    final beacons = await _bluetooth.getBeaconsAsync();
    if (beacons.isEmpty) throw LocationNotFoundException();

    final closest = beacons.reduce(_closestBeacon);

    try {
      final id = closest.major.toString();
      return _database.getLocationFromId(id);
    } catch (e) {
      throw LocationNotFoundException();
    }
  }

  Beacon _closestBeacon(Beacon a, Beacon b) => a.distance < b.distance ? a : b;
}
