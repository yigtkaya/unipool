part of 'trips_bloc.dart';

abstract class TripsEvent {}

class FilterTripsEvent extends TripsEvent {
  final String from;
  final String to;
  final String? dateTime;
  final String userId;

  FilterTripsEvent({required this.from, required this.to, required this.dateTime, required this.userId});
}
