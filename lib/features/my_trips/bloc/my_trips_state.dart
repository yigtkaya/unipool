part of 'my_trips_bloc.dart';

sealed class MyTripsState extends BaseState {
  const MyTripsState();
  @override
  List<Object?> get props => [];
}

final class MyTripsInitial extends MyTripsState {}

final class MyTripsLoading extends MyTripsState {}

final class MyTripsLoaded extends MyTripsState {
  final List<TripsResponseModel> upcomingTrips;
  final TripsResponseModel? ongoingTrip;
  final List<TripsResponseModel> pastTrips;
  final TripFilter selectedFilter;

  const MyTripsLoaded({
    required this.upcomingTrips,
    required this.ongoingTrip,
    required this.pastTrips,
    this.selectedFilter = TripFilter.driver,
  });

  @override
  List<Object?> get props => [upcomingTrips, ongoingTrip, pastTrips, selectedFilter];

  MyTripsLoaded copyWith({
    List<TripsResponseModel>? upcomingTrips,
    TripsResponseModel? ongoingTrip,
    List<TripsResponseModel>? pastTrips,
    TripFilter? selectedFilter,
  }) {
    return MyTripsLoaded(
      upcomingTrips: upcomingTrips ?? this.upcomingTrips,
      ongoingTrip: ongoingTrip ?? this.ongoingTrip,
      pastTrips: pastTrips ?? this.pastTrips,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}

final class MyTripsError extends MyTripsState {
  final String errorMessage;

  const MyTripsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

enum TripFilter { driver, passenger }
