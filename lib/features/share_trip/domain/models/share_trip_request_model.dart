import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

part 'share_trip_request_model.mapper.dart';

@MappableClass()
class ShareTripRequestModel with ShareTripRequestModelMappable {
  const ShareTripRequestModel({
    required this.startDestination,
    required this.finalDestination,
    required this.type,
    required this.departureTime,
    required this.passengerLimit,
    required this.status,
    required this.createdBy,
    required this.createdAt,
  });

  @MappableField(key: 'start_destination')
  final GeoapifyPlace startDestination;
  @MappableField(key: 'final_destination')
  final GeoapifyPlace finalDestination;
  final String type;
  final String status;
  final String? departureTime;
  final int? passengerLimit;
  @MappableField(key: 'created_by')
  final String? createdBy;
  final String? createdAt;
}
