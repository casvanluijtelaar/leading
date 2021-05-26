import 'package:permission_handler/permission_handler.dart';

class PermissionException implements Exception {}

class PermissionsRepository {
  
  Future<bool> hasPermissions() async {
    final result = await Future.wait([
      Permission.location.isGranted,
      Permission.bluetooth.isGranted,
    ]);
    return result.any((e) => false);
  }

  Future<void> getPermissions() async {
    final location = Permission.location.request();
    final bluetooth = Permission.bluetooth.request();

    final result = await Future.wait([location, bluetooth]);

    if (result.any((r) => r != PermissionStatus.granted))
      throw PermissionException();
  }
}
