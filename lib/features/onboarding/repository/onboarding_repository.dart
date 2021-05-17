import 'package:flutter/material.dart';
import 'package:leading/app/data/src/database.dart';
import 'package:leading/app/data/utils/color_utils.dart';
import 'package:platform_device_id/platform_device_id.dart';



class ColorException implements Exception {}
class IdentificationException implements Exception {}

class OnboardingRepository {
  const OnboardingRepository(this._database);
  final Database _database;

  Future<Color> getUniqueColor() async {
    try {
      final users = await _database.getUsers();
      final colors = users.map((u) => u.color);

      final color = ColorUtils.colors.firstWhere(
        (c) => !colors.contains(c),
        orElse: () => ColorUtils.colors.first,
      );

      return color;
    } catch (e) {
      throw ColorException();
    }
  }

  Future<String> getId() async {
    try {
      final deviceId = await PlatformDeviceId.getDeviceId;
      if (deviceId == null) throw IdentificationException();

      return deviceId;
    } catch (e) {
      throw IdentificationException();
    }
  }
}
