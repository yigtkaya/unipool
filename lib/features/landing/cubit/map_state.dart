part of 'map_cubit.dart';

final class MapState extends Equatable {
  final bool isFollowingLocation;
  final GoogleMapController? mapController;
  final Set<Marker> markers;
  final Map<LatLngBounds, List<Marker>> clusters;
  final Set<Marker> visibleMarkers;
  final LatLngBounds? visibleBounds;

  const MapState({
    this.isFollowingLocation = false,
    this.mapController,
    this.markers = const {},
    this.clusters = const {},
    this.visibleMarkers = const {},
    this.visibleBounds,
  });

  MapState copyWith({
    bool? isFollowingLocation,
    GoogleMapController? mapController,
    Set<Marker>? markers,
    Map<LatLngBounds, List<Marker>>? clusters,
    Set<Marker>? visibleMarkers,
    LatLngBounds? visibleBounds,
  }) {
    return MapState(
      isFollowingLocation: isFollowingLocation ?? this.isFollowingLocation,
      mapController: mapController ?? this.mapController,
      markers: markers ?? this.markers,
      clusters: clusters ?? this.clusters,
      visibleMarkers: visibleMarkers ?? this.visibleMarkers,
      visibleBounds: visibleBounds ?? this.visibleBounds,
    );
  }

  @override
  List<Object?> get props => [
        isFollowingLocation,
        mapController,
        markers,
        clusters,
        visibleMarkers,
        visibleBounds,
      ];
}
