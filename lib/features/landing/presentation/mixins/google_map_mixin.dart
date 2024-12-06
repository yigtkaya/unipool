part of '../landing_page_view.dart';

mixin _GoogleMapMixin on State<_GoogleMapView> {
  double _lastZoom = 8.0;

  late final MarkerCreator _markerCreator;
  late final ClusterManager _clusterManager;

  Set<Marker> _lastMarkers = {};
  Map<LatLngBounds, List<Marker>> _lastClusters = {};

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _markerCreator.clearCache();
    super.dispose();
  }

  void _debouncedMarkerUpdate(double zoom) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 150), () {
      _updateMarkers(zoom);
    });
  }

  @override
  void initState() {
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;
    context.read<MyTripsBloc>().add(LoadMyTrips(userId: userId.toString()));
    super.initState();
    _markerCreator = MarkerCreator();
    _clusterManager = ClusterManager(
      onMarkersUpdate: _updateMarkers,
      onClusterTap: _handleClusterTap,
    );
  }

  void _handleClusterTap(LatLng position, double zoom) {
    final mapController = context.read<MapCubit>().state.mapController;
    if (mapController == null) return;

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, zoom),
    );
    _updateMarkers(zoom);
  }

  void _handleLocatePressed(BuildContext context) {
    final locationState = context.read<LocationBloc>().state;

    if (locationState is LocationSuccess) {
      final mapCubit = context.read<MapCubit>();
      mapCubit.toggleLocationFollowing();
      mapCubit.animateToLocation(locationState.location);
    }
  }

  void _updateMarkers(double zoom) async {
    final tripsState = context.read<TripsBloc>().state;
    if (tripsState is! TripsLoaded) return;

    final newMarkers = <Marker>{};
    final newClusters = <LatLngBounds, List<Marker>>{};

    final isClusteredView = zoom <= 13;

    if (isClusteredView) {
      newClusters.addAll(await _createClusters(tripsState.trips));
      for (var cluster in newClusters.entries) {
        final center = _clusterManager.getClusterCenter(cluster.value);
        final marker = await _clusterManager.createClusterMarker(
          center,
          cluster.value.length,
          cluster.value,
          context,
        );
        newMarkers.add(marker);
      }
    } else {
      for (var i = 0; i < tripsState.trips.length; i++) {
        final trip = tripsState.trips[i];
        if (trip.trip.startDestination.lat == null || trip.trip.startDestination.lon == null) continue;

        final marker = await _createMarker(trip, i);
        newMarkers.add(marker);
      }
    }

    _lastMarkers = newMarkers;
    _lastClusters = newClusters;
    _lastZoom = zoom;

    if (!mounted) return;

    context.read<MapCubit>().updateMarkers(newMarkers, newClusters);
  }

  Future<Map<LatLngBounds, List<Marker>>> _createClusters(List<dynamic> trips) async {
    final clusters = <LatLngBounds, List<Marker>>{};

    for (var trip in trips) {
      if (trip.trip.startDestination.lat == null || trip.trip.startDestination.lon == null) continue;

      final position = LatLng(
        trip.trip.startDestination.lat!,
        trip.trip.startDestination.lon!,
      );
      final marker = await _createMarker(trip, trips.indexOf(trip));

      var addedToCluster = false;
      for (var bounds in clusters.keys) {
        if (_clusterManager.isInBounds(position, bounds)) {
          clusters[bounds]!.add(marker);
          addedToCluster = true;
          break;
        }
      }

      if (!addedToCluster) {
        clusters[_clusterManager.createBounds(position)] = [marker];
      }
    }

    return clusters;
  }

  Future<Marker> _createMarker(dynamic trip, int index) async {
    final customIcon = await _markerCreator.createCustomMarker(
      trip.ownerProfile.profilePhoto.toString(),
      tripType: trip.trip.type,
    );

    // Apply a small offset based on the index
    final offset = 0.0001 * index; // Adjust the offset value as needed

    return Marker(
      markerId: MarkerId(trip.trip.tripId.toString()),
      position: LatLng(
        trip.trip.startDestination.lat! + offset,
        trip.trip.startDestination.lon! + offset,
      ),
      icon: customIcon,
      infoWindow: InfoWindow(
        title: trip.ownerProfile.name,
        snippet: trip.trip.type == TripType.lookingPassenger ? 'Looking for passengers' : 'Looking for driver',
      ),
      onTap: () => _showTripDetails(context, trip),
    );
  }

  void _showTripDetails(BuildContext context, dynamic trip) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      builder: (context) {
        return TripDetailsBottomSheet(tripResponseModel: trip);
      },
    );
  }
}
