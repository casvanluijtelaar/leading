import 'package:firebase_database/firebase_database.dart';

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
      if (snapshot.value == null || snapshot.value is! List<Map>)
        throw DatabaseException();

      final formatted = List<Map<String, dynamic>>.from(snapshot.value);

      return formatted.map((d) {
        return Location(id: d['id'], name: d['name']);
      }).toList();
    } catch (_) {
      throw DatabaseException();
    }
  }

  Future<Location> getLocationFromId(String id) async {
    try {
      final snapshot = await _db.reference().child(_LOCATIONS).child(id).once();
      final data = snapshot.value;

      if (snapshot.value == null || snapshot.value is! Map)
        throw DatabaseException();

      final formatted = Map<String, dynamic>.from(data);
      return Location(id: formatted['id'], name: formatted['name']);
    } catch (_) {
      throw DatabaseException();
    }
  }

  Future<List<User>> getUsers() async {
    final snapshot = await _db.reference().child(_USERS).once();

    if (snapshot.value == null || snapshot.value is! Map)
      throw DatabaseException();

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

  Future<void> removeUser(Map<String, dynamic> user) {
    return _db.reference().child(_USERS).child(user['id']).remove();
  }
}
