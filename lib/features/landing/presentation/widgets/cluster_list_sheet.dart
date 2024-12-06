part of '../landing_page_view.dart';

class ClusterListSheet extends StatelessWidget {
  const ClusterListSheet({
    super.key,
    required this.zoom,
  });

  final double zoom;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final visibleMarkers = state.visibleMarkers;

        if (visibleMarkers.isEmpty) {
          return const SizedBox.shrink();
        }

        return DraggableScrollableActuator(
          child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDesignConstants.horizontalPaddingMedium,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDesignConstants.borderRadiusMedium),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDesignConstants.spacingLarge),
                    const _DragHandle(),
                    SizedBox(height: AppDesignConstants.spacingLarge),
                    Text(
                      context.l10n.inThisArea(visibleMarkers.length),
                      textAlign: TextAlign.start,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppDesignConstants.spacingMedium),
                    BlocBuilder<TripsBloc, TripsState>(
                      builder: (context, tripsState) {
                        if (tripsState is TripsLoaded) {
                          final trips = tripsState.trips;
                          final tripsInCluster = trips
                              .where(
                                  (trip) => visibleMarkers.any((marker) => marker.markerId.value == trip.trip.tripId))
                              .toList();
                          return Column(
                            children: tripsInCluster
                                .map(
                                  (trip) => TripListItem(
                                    tripResponseModel: trip,
                                  ),
                                )
                                .toList(),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: AppDesignConstants.spacingLarge),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.kGrey,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
