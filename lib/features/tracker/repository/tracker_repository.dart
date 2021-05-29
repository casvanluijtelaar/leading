import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/app/data/src/database.dart';

import 'package:leading/app/utils/beacon_utils.dart';

class TrackerRepository {
  const TrackerRepository(this._database, this._bluetooth);

  final Database _database;
  final Bluetooth _bluetooth;

  Future<void> uploadUser(User user) {
    return _database.addUser(user);
  }

  Future<void> removeUser(User user) {
    return _database.removeUser(user);
  }

  Stream<bool> reachedDestination(User user) {
    return _bluetooth.getBeaconsStream().map((beacons) {
      final endBeacon =
          beacons.where((b) => b.macAddress == user.endLocation!.mac).toList();

      if (endBeacon.isEmpty) return false;
      if (endBeacon[0].distance > 3) return false;
      return true;
    });
  }
}
