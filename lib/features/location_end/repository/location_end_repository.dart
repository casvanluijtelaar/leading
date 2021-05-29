import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/src/database.dart';

class NoLocationsException implements Exception {}

class LocationEndRepository {
  const LocationEndRepository(this._database);

  final Database _database;

  Future<List<Location>> getLocations(Location currentLocation) async {
    final locations = await _database.getLocations();
    locations..removeWhere((e) => e == currentLocation);

    return locations;
  }
}
