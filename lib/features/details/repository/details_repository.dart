import 'package:flutter/material.dart';
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
}
