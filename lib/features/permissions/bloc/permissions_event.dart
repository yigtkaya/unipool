part of 'permissions_bloc.dart';

sealed class PermissionEvent {
  const PermissionEvent();
}

class CheckPermissionsEvent extends PermissionEvent {
  const CheckPermissionsEvent();
}

class RequestPermissionEvent extends PermissionEvent {
  final Permission permission;
  const RequestPermissionEvent(this.permission);
}

class RequestAllPermissionsEvent extends PermissionEvent {
  const RequestAllPermissionsEvent();
}

class DisablePermissionEvent extends PermissionEvent {
  final Permission permission;
  const DisablePermissionEvent(this.permission);
}
