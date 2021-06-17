import 'package:flutter_test/flutter_test.dart';
import 'package:leading/app/data/models/hub.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/route.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/app/utils/color_utils.dart';
import 'package:leading/features/details/details.dart';
import 'package:mocktail/mocktail.dart';

import 'package:uuid/uuid.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  final _database = MockDatabase();
  final _uuid = const Uuid();

  final _repository = DetailsRepository(_database, _uuid);

  test('expect the first free color to be returned', () async {
    final activeUsers = 3;

    when(_database.getUsers).thenAnswer((invocation) async =>
        List<User>.generate(
            activeUsers, (index) => User(color: ColorUtils.colors[index])));

    final color = await _repository.getUniqueColor();

    expect(color, ColorUtils.colors[activeUsers]);
  });

  test('expect a valid uuid based on the platform', () async {
    //TODO: figure out how to mock PlatformDeviceId
  });

  group('route generation', () {
    final route = Route(from: 0, to: 1, hubs: [
      Hub(id: 0, direction: [0, 1])
    ]);

    when(_database.getRoutes).thenAnswer((invocation) async => [route]);

    test('expect correct route', () async {
      final user = User(
        startLocation: const Location(id: 0, mac: '', name: ''),
        endLocation: const Location(id: 1, mac: '', name: ''),
      );

      final result = await _repository.getRoute(user);
      expect(result, route.hubs);
    });

    test('expect correct route inverted', () async {
      final user = User(
        startLocation: const Location(id: 1, mac: '', name: ''),
        endLocation: const Location(id: 0, mac: '', name: ''),
      );

      final result = await _repository.getRoute(user);
      expect(
        result,
        [
          Hub(id: 0, direction: [1, 0])
        ],
        reason: 'direction should be inverted',
      );
    });
  });
}
