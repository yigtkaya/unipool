import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';

abstract class TripsRepository {
  Future<List<TripsResponseModel>> filterTrips(
    String from,
    String to,
    String? dateTime,
    String userId,
  );
}
