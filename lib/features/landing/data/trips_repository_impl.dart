import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/features/landing/domain/trips_repository.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';

@Injectable(as: TripsRepository)
class TripsRepositoryImpl implements TripsRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<List<TripsResponseModel>> filterTrips(String from, String to, String? dateTime, String userId) async {
    try {
      final response = await supabase.rpc(
        'filtered_trips',
        params: {
          'from_search_text': "",
          'to_search_text': "",
          'timestamp_value': dateTime,
          'user_id': userId,
        },
      );

      if (response.isEmpty) {
        return const <TripsResponseModel>[];
      }

      final tripsList = (response as List)
          .map(
            (e) => TripsResponseModelMapper.fromMap(e as Map<String, dynamic>),
          )
          .toList();
      return tripsList;
    } on StorageException {
      return const <TripsResponseModel>[];
    }
  }
}
