part of 'trips_bloc.dart';

abstract class TripsState extends Equatable {
  const TripsState();
}

class TripsInitial extends TripsState {
  const TripsInitial();
  @override
  List<Object?> get props => [];
}

class TripsLoading extends TripsState {
  const TripsLoading();
  @override
  List<Object?> get props => [];
}

class TripsLoaded extends TripsState {
  final List<TripsResponseModel> trips;

  const TripsLoaded(this.trips);
  @override
  List<Object?> get props => [trips];
}

class TripsError extends TripsState {
  final String error;

  const TripsError(this.error);
  @override
  List<Object?> get props => [error];
}
