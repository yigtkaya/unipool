import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'fetch_trips_model.mapper.dart';

@MappableClass()
final class TripsResponseModel with TripsResponseModelMappable {
  @MappableField(key: 'ride')
  final Trip trip;
  @MappableField(key: 'created_by_profile')
  final ProfileModel ownerProfile;
  final List<dynamic> passengers;

  const TripsResponseModel({
    required this.trip,
    required this.ownerProfile,
    required this.passengers,
  });
}
