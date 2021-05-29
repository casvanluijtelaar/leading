import 'package:permission_handler/permission_handler.dart';

class PermissionException implements Exception {}

class PermissionsRepository {
  Future<bool> hasPermissions() async {
    final result = await Future.wait([
      Permission.location.isDenied,
      Permission.bluetooth.isDenied,
    ]);
    return result.any((e) => false);
  }

  Future<bool> getPermissions() async {
    final location = await Permission.location.request();
    final bluetooth = await Permission.bluetooth.request();

    final hasLocation = location == PermissionStatus.granted ||
        location == PermissionStatus.limited;

    final hasBluetooth = bluetooth == PermissionStatus.granted ||
        bluetooth == PermissionStatus.limited;

    return hasLocation && hasBluetooth;
  }
}
