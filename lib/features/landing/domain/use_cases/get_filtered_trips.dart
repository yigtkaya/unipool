import 'package:injectable/injectable.dart';
import 'package:unipool/features/landing/domain/trips_repository.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';

@injectable
final class FilterTripsUseCase {
  final TripsRepository repository;

  FilterTripsUseCase(this.repository);

  Future<List<TripsResponseModel>> call({
    required String from,
    required String to,
    required String? dateTime,
    required String userId,
  }) {
    return repository.filterTrips(
      from,
      to,
      dateTime,
      userId,
    );
  }
}
