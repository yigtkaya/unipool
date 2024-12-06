part of 'location_bloc.dart';

abstract class LocationEvent {}

class StartLocationUpdates extends LocationEvent {}

class LocationUpdated extends LocationEvent {
  final LatLng location;
  LocationUpdated(this.location);
}

class StopLocationUpdates extends LocationEvent {}
