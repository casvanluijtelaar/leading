import 'package:firebase_database/firebase_database.dart';
import 'package:leading/app/data/models/hub.dart';

import '../models/location.dart';
import '../models/user.dart';

class DatabaseException implements Exception {}

// ignore_for_file: constant_identifier_names
class Database {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  static const String _USERS = 'users';
  static const String _LOCATIONS = 'locations';

  Future<List<Location>> getLocations() async {
    try {
      final snapshot = await _db.reference().child(_LOCATIONS).once();

      if (snapshot.value == null) return [];

      final formatted = (snapshot.value as Map).values;

      return formatted.map((d) {
        // ignore: avoid_dynamic_calls
        return Location(mac: d['mac'], name: d['name']);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Location?> getLocationFromMac(String mac) async {
    final snapshot = await _db.reference().child(_LOCATIONS).child(mac).once();
    final data = snapshot.value;

    if (snapshot.value == null || snapshot.value is! Map) return null;

    final formatted = Map<String, dynamic>.from(data);
    return Location(mac: formatted['mac'], name: formatted['name']);
  }

  Future<List<User>> getUsers() async {
    final snapshot = await _db.reference().child(_USERS).once();

    if (snapshot.value == null) return [];
    if (snapshot.value is! List) throw DatabaseException();

    final formatted = List<Map<String, dynamic>>.from(snapshot.value);
    return formatted.map((d) {
      return User(color: d['color'], id: d['id']);
    }).toList();
  }

  Future<void> addUser(User user) {
    return _db
        .reference()
        .child(_USERS)
        .child(user.id.toString())
        .set(user.toMap());
  }

  Future<void> removeUser(User user) {
    return _db.reference().child(_USERS).child(user.id!).remove();
  }
}
