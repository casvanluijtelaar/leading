import 'dart:async';

import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/app/utils/beacon_utils.dart';
import 'package:leading/app/utils/consts.dart';

class LocationStartRepository {
  const LocationStartRepository(this._bluetooth, this._database);

  final Bluetooth _bluetooth;
  final Database _database;

  Future<Location?> getLocation() async {
    final beacons = await _bluetooth.getBeaconsStream().firstWhere((bs) {
      return bs.any((b) => b.distance < Kdistance.startDistance);
    });

    final beacon = BeaconUtils.getNearestBeacon(beacons);
    return _database.getLocationFromMac(beacon.macAddress!);
  }
}
