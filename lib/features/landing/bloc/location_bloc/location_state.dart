part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final LatLng location;
  const LocationSuccess({required this.location});
  @override
  List<Object?> get props => [location];
}

class LocationFailure extends LocationState {
  final String error;
  const LocationFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
