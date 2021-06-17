import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/features/location_end/location_end.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  final _database = MockDatabase();
  final _repository = LocationEndRepository(_database);

  test('expect all locations from database except the provided one', () async {
    final locations = List<Location>.generate(
      5,
      (i) => Location(name: i.toString(), mac: i.toString(), id: i),
    );

    when(_database.getLocations)
        .thenAnswer((invocation) async => locations.toList());

    final currentLocation = locations[Random().nextInt(locations.length)];
    final filteredLocations = await _repository.getLocations(currentLocation);

    print(locations);
    print(currentLocation);
    print(filteredLocations);

    expect(filteredLocations.length, locations.length - 1);
    expect(!filteredLocations.contains(currentLocation), isTrue);
  });
}
