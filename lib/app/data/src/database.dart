import 'package:firebase_database/firebase_database.dart';

import '../models/location.dart';
import '../models/route.dart';
import '../models/user.dart';

// ignore_for_file: constant_identifier_names
// ignore_for_file: avoid_dynamic_calls

/// wrapper class for the Firestore Realtime Database
class Database {
  final DatabaseReference _db = FirebaseDatabase.instance.reference();

  /// database location where user objects are stored
  static const String _USERS = 'users';

  /// database location where location objects are stored
  static const String _LOCATIONS = 'locations';

  /// database location where routes are stored
  static const String _ROUTES = 'routes';

  /// gets all entries in the [_LOCATIONS] database locations
  Future<List<Location>> getLocations() async {
    try {
      final snapshot = await _db.child(_LOCATIONS).once();

      if (snapshot.value == null) return [];

      final formatted = snapshot.value.values;

      return List<Location>.from(
        formatted.map((d) => Location.fromJson(d)).toList(),
      );
    } catch (e) {
      return [];
    }
  }

  /// gets all entries in the [_ROUTES] database locations
  Future<List<Route>> getRoutes() async {
    final snapshot = await _db.child(_ROUTES).once();

    if (snapshot.value == null) return [];
    final formatted = snapshot.value;

    return List<Route>.from(formatted.map((f) => Route.fromJson(f)).toList());
  }

  /// required a Mac address and fetches data linked to that location
  Future<Location?> getLocationFromMac(String mac) async {
    final snapshot = await _db.child(_LOCATIONS).child(mac).once();
    final data = snapshot.value;

    if (snapshot.value == null || snapshot.value is! Map) return null;

    final formatted = Map<String, dynamic>.from(data);
    return Location.fromJson(formatted);
  }

  /// gets all entries in the [_USERS] database locations
  Future<List<User>> getUsers() async {
    final snapshot = await _db.child(_USERS).once();

    if (snapshot.value == null) return [];

    final formatted = List.from(snapshot.value.values);
    return List<User>.from(formatted.map((d) {
      return User.fromMap(d);
    }).toList());
  }

  /// adds a [User] object to the [_USERS] databse location
  Future<void> addUser(User user) {
    return _db.child(_USERS).child(user.id.toString()).set(user.toMap());
  }

  /// removes a [User] object to the [_USERS] databse location
  Future<void> removeUser(User user) {
    return _db.child(_USERS).child(user.id!).remove();
  }
}
