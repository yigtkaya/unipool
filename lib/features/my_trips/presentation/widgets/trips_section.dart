part of '../my_trips_view.dart';

final class TripsSection extends StatelessWidget {
  final List<TripsResponseModel> trips;
  final String title;
  const TripsSection({
    super.key,
    required this.trips,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

    return SliverMainAxisGroup(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyHeaderDelegate(
            title: title,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: AppDesignConstants.verticalPaddingSmall),
                child: _TripItem(
                  response: trips[index],
                ),
              ),
              childCount: trips.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDesignConstants.spacingLarge,
          ),
        ),
      ],
    );
  }
}
