import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@LazySingleton()
class PermissionHandler {
  Future<Map<Permission, PermissionStatus>> requestInitialPermissions() async {
    final permissionStatuses = <Permission, PermissionStatus>{};

    final requiredPermissions = <Permission>[
      Permission.notification,
      Permission.locationWhenInUse,
    ];

    for (final permission in requiredPermissions) {
      final status = await permission.status;
      if (status.isDenied) {
        permissionStatuses[permission] = await permission.request();
      } else {
        permissionStatuses[permission] = status;
      }
    }

    return permissionStatuses;
  }

  Future<PermissionStatus> checkAndRequestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isDenied) {
      final result = await permission.request();
      return result;
    }
    return status;
  }

  Future<PermissionStatus> isLocationPermissionGranted() async {
    return await checkAndRequestPermission(Permission.locationWhenInUse);
  }

  Future<PermissionStatus> isNotificationPermissionGranted() async {
    return await checkAndRequestPermission(Permission.notification);
  }

  Future<Map<Permission, PermissionStatus>> checkPermissionStatus() async {
    final requiredPermissions = <Permission>[
      Permission.notification,
      Permission.locationWhenInUse,
    ];
    final permissionStatuses = <Permission, PermissionStatus>{};
    for (final permission in requiredPermissions) {
      final status = await permission.status;
      permissionStatuses[permission] = status;
    }
    return permissionStatuses;
  }
}
