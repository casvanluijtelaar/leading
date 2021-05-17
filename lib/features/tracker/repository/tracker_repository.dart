import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/app/data/src/database.dart';

class TrackerRepository {
  const TrackerRepository(this._database, this._bluetooth);

  final Database _database;
  final Bluetooth _bluetooth;

  Future<void> uploadUser(User user) {
    return _database.addUser(user);
  }

}
