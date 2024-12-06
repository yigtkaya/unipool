part of '../landing_page_view.dart';

final class _GoogleMapView extends StatefulWidget {
  const _GoogleMapView();

  @override
  State<_GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<_GoogleMapView> with _GoogleMapMixin {
  @override
  Widget build(BuildContext context) {
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, mapState) {
        return BlocBuilder<MapCubit, MapState>(
          builder: (context, markersState) {
            return Stack(
              children: [
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    if (locationState is LocationSuccess) {
                      final currentLocation = locationState.location;
                      return BlocBuilder<TripsBloc, TripsState>(
                        builder: (context, tripsState) {
                          if (tripsState is TripsLoaded) {
                            return GoogleMap(
                              onMapCreated: (controller) {
                                context.read<MapCubit>().setMapController(controller);
                                _updateMarkers(15.0); // Initial zoom level
                              },
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  currentLocation.latitude,
                                  currentLocation.longitude,
                                ),
                                zoom: 15.0,
                              ),
                              zoomControlsEnabled: false,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              markers: markersState.markers,
                              onCameraMove: (position) {
                                context.read<MapCubit>().stopFollowingLocation();
                                _lastZoom = position.zoom;
                                _debouncedMarkerUpdate(position.zoom);
                              },
                              onCameraIdle: () {
                                final controller = context.read<MapCubit>().state.mapController;
                                if (controller != null) {
                                  controller.getVisibleRegion().then((bounds) {
                                    context.read<MapCubit>().updateVisibleRegion(bounds);
                                  });
                                }
                              },
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimary100),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimary100),
                      ),
                    );
                  },
                ),
                MapFilterSearchBar(),
                Positioned(
                  right: 10,
                  bottom: 40,
                  child: Column(
                    children: [
                      LocateButton(
                        isLocating: mapState.isFollowingLocation,
                        onPressed: () => _handleLocatePressed(context),
                      ),
                      SizedBox(
                        height: AppDesignConstants.spacing,
                      ),
                      RefreshButton(
                        onPressed: () => context.read<TripsBloc>().add(
                              FilterTripsEvent(
                                from: '',
                                to: '',
                                dateTime: null,
                                userId: userId!,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                if (markersState.markers.length >= 2 && _lastZoom > 13)
                  ClusterListSheet(
                    zoom: _lastZoom,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
