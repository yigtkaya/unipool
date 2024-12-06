import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

part 'trip_model.mapper.dart';

@MappableClass()
class Trip with TripMappable {
  @MappableField(key: 'trip_id')
  final String? tripId;
  @MappableField(key: 'start_destination')
  final GeoapifyPlace startDestination;
  @MappableField(key: 'final_destination')
  final GeoapifyPlace finalDestination;
  @MappableField(key: 'created_by')
  final String? createdBy;
  @MappableField(key: 'passenger_limit')
  final int? passengerLimit;
  final List<String>? invites;
  final String? departureTime;
  final TripStatus status;
  final TripType type;
  @MappableField(key: 'review_ids')
  final List<String>? reviewIds;
  @MappableField(key: 'created_at')
  final String? createdAt;
  @MappableField(key: 'end_at')
  final String? endAt;

  const Trip({
    this.tripId,
    this.createdBy,
    this.passengerLimit,
    this.invites,
    this.reviewIds,
    this.departureTime,
    this.createdAt,
    required this.startDestination,
    required this.finalDestination,
    this.endAt,
    required this.status,
    required this.type,
  });
}

@MappableEnum()
enum TripStatus {
  active,
  ongoing,
  past,
}

@MappableEnum()
enum TripType {
  taxiShare,
  lookingDriver,
  lookingPassenger,
}
