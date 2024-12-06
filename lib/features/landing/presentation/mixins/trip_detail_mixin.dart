part of '../landing_page_view.dart';

mixin TripDetailMixin on State<TripDetailsBottomSheet> {
  void onInvitePressed(
    ProfileModel inviteeProfile,
    Trip inviteeTrip,
  ) {
    final myTrips = (context.read<MyTripsBloc>().state as MyTripsLoaded).upcomingTrips;
    const radiusInKm = 1.0; // Define the radius in kilometers

    // Filter trips with opposite trip type and within 1 hour of departure time
    final userTrips = myTrips.where((trip) {
      final isOppositeType = trip.trip.type != inviteeTrip.type;
      final isWithinTimeFrame =
          (DateTime.parse(inviteeTrip.departureTime!).difference(DateTime.parse(trip.trip.departureTime!)).inHours)
                  .abs() <=
              1;
      final isWithinRadius = _calculateDistance(
            trip.trip.startDestination.lat!,
            trip.trip.startDestination.lon!,
            inviteeTrip.startDestination.lat!,
            inviteeTrip.startDestination.lon!,
          ) <=
          radiusInKm;
      return isOppositeType && isWithinTimeFrame && isWithinRadius;
    }).toList();

    showBarModalBottomSheet(
      context: context,
      builder: (context) => InviteListSheet(
        trips: userTrips,
        inviteeProfile: inviteeProfile,
        inviteeTripId: inviteeTrip.tripId!,
      ),
    );
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadiusKm = 6371.0;
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
