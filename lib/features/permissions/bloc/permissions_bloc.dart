import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unipool/features/permissions/service/permission_handler.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

@injectable
class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final PermissionHandler _permissionHandler;

  PermissionBloc({
    PermissionHandler? permissionHandler,
  })  : _permissionHandler = permissionHandler ?? PermissionHandler(),
        super(const PermissionState(permissions: {})) {
    on<CheckPermissionsEvent>(_onCheckPermissions);
    on<RequestPermissionEvent>(_onRequestPermission);
    on<RequestAllPermissionsEvent>(_onRequestAllPermissions);
  }

  Future<void> _onCheckPermissions(
    CheckPermissionsEvent event,
    Emitter<PermissionState> emit,
  ) async {
    final permissions = await _permissionHandler.checkPermissionStatus();
    emit(
      state.copyWith(
        permissions: permissions,
      ),
    );
  }

  Future<void> _onRequestPermission(
    RequestPermissionEvent event,
    Emitter<PermissionState> emit,
  ) async {
    final permission = await _permissionHandler.checkAndRequestPermission(event.permission);

    emit(
      state.copyWith(
        permissions: {...state.permissions, event.permission: permission},
      ),
    );
  }

  Future<void> _onRequestAllPermissions(
    RequestAllPermissionsEvent event,
    Emitter<PermissionState> emit,
  ) async {
    final permissions = await _permissionHandler.requestInitialPermissions();
    emit(
      state.copyWith(
        permissions: permissions,
      ),
    );
  }
}
