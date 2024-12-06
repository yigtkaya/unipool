import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'map_state.dart';

@injectable
final class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());

  void setMapController(GoogleMapController controller) {
    emit(state.copyWith(mapController: controller));
  }

  void toggleLocationFollowing() {
    emit(state.copyWith(isFollowingLocation: !state.isFollowingLocation));
  }

  void stopFollowingLocation() {
    if (state.isFollowingLocation) {
      emit(state.copyWith(isFollowingLocation: false));
    }
  }

  Future<void> animateToLocation(LatLng location) async {
    final controller = state.mapController;
    if (controller == null) return;

    final zoom = state.isFollowingLocation ? 18.0 : await controller.getZoomLevel();

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: zoom,
        ),
      ),
    );
  }

  void updateMarkers(Set<Marker> newMarkers, Map<LatLngBounds, List<Marker>> newClusters) {
    emit(state.copyWith(
      markers: newMarkers,
      clusters: newClusters,
    ));
    _updateVisibleMarkers(state.visibleBounds);
  }

  void updateVisibleRegion(LatLngBounds bounds) {
    emit(state.copyWith(visibleBounds: bounds));
    _updateVisibleMarkers(bounds);
  }

  void _updateVisibleMarkers(LatLngBounds? bounds) {
    if (bounds == null) return;

    final visibleMarkers = state.markers.where((marker) {
      return bounds.contains(marker.position);
    }).toSet();

    emit(state.copyWith(visibleMarkers: visibleMarkers));
  }
}
