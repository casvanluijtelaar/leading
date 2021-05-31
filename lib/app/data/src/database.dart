import 'package:firebase_database/firebase_database.dart';

import '../models/location.dart';
import '../models/route.dart';
import '../models/user.dart';

// ignore_for_file: constant_identifier_names
// ignore_for_file: avoid_dynamic_calls
class Database {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  static const String _USERS = 'users';
  static const String _LOCATIONS = 'locations';
  static const String _ROUTES = 'routes';

  Future<List<Location>> getLocations() async {
    try {
      final snapshot = await _db.reference().child(_LOCATIONS).once();

      if (snapshot.value == null) return [];

      final formatted = snapshot.value.values;

      return List<Location>.from(
        formatted.map((d) => Location.fromJson(d)).toList(),
      );
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Route>> getRoutes() async {
    final snapshot = await _db.reference().child(_ROUTES).once();

    if (snapshot.value == null) return [];
    final formatted = snapshot.value;

    return List<Route>.from(formatted.map((f) => Route.fromJson(f)).toList());
  }

  Future<Location?> getLocationFromMac(String mac) async {
    final snapshot = await _db.reference().child(_LOCATIONS).child(mac).once();
    final data = snapshot.value;

    if (snapshot.value == null || snapshot.value is! Map) return null;

    final formatted = Map<String, dynamic>.from(data);
    return Location.fromJson(formatted);
  }

  Future<List<User>> getUsers() async {
    final snapshot = await _db.reference().child(_USERS).once();

    if (snapshot.value == null) return [];

    final formatted = List.from(snapshot.value.values);
    return List<User>.from(formatted.map((d) {
      return User.fromMap(d);
    }).toList());
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
