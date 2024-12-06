part of 'my_trips_bloc.dart';

sealed class MyTripsEvent extends BaseEvent {
  MyTripsEvent();
}

final class LoadMyTrips extends MyTripsEvent {
  final String userId;
  LoadMyTrips({required this.userId});
}

final class FilterTrips extends MyTripsEvent {
  final TripFilter filter;
  FilterTrips({required this.filter});
}

final class ShareTrip extends MyTripsEvent {
  final ShareTripRequestModel request;
  ShareTrip({required this.request});
}

final class InviteUserToTrip extends MyTripsEvent {
  final InviteModel request;
  InviteUserToTrip({required this.request});
}
