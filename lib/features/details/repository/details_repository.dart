import 'package:flutter/material.dart' hide Route;
import 'package:leading/app/data/models/hub.dart';
import 'package:leading/app/data/models/route.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/app/utils/color_utils.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:uuid/uuid.dart';

class DetailsRepository {
  const DetailsRepository(this._database, this._uuid);

  final Database _database;
  final Uuid _uuid;

  Future<Color> getUniqueColor() async {
    final users = await _database.getUsers();
    final colors = users.map((u) => u.color);

    final color = ColorUtils.colors.firstWhere(
      (c) => !colors.contains(c),
      orElse: () => ColorUtils.colors.first,
    );

    return color;
  }

  Future<String> getId() async {
    final deviceId = await PlatformDeviceId.getDeviceId;
    if (deviceId != null) return deviceId;
    return _uuid.v4();
  }

  Future<List<Hub>> getRoute(User user) async {
    final routes = await _database.getRoutes();

    for (final route in routes) {
      if (_isCorrectRoute(user, route)) {
        return route.hubs;
      } else if (_isCorrectRouteInverted(user, route)) {
        return route.hubs.reversed
            .map((h) => Hub(
                  id: h.id,
                  direction: h.direction.reversed.toList(),
                ))
            .toList();
      }
    }
    return [];
  }

  bool _isCorrectRoute(User user, Route route) {
    if (user.startLocation!.id == route.from &&
        user.endLocation!.id == route.to) return true;
    return false;
  }

  bool _isCorrectRouteInverted(User user, Route route) {
    if (user.startLocation!.id == route.to &&
        user.endLocation!.id == route.from) return true;
    return false;
  }
}
