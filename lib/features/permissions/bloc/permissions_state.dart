part of 'permissions_bloc.dart';

final class PermissionState {
  const PermissionState({required this.permissions});

  final Map<Permission, PermissionStatus> permissions;

  PermissionState copyWith({
    Map<Permission, PermissionStatus>? permissions,
  }) {
    return PermissionState(
      permissions: permissions ?? this.permissions,
    );
  }
}
