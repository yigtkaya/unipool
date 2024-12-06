import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/my_trips/domain/repository/my_trips_repository.dart';
import 'package:unipool/features/share_trip/domain/models/share_trip_request_model.dart';

@injectable
final class ShareTripUseCase {
  final MyTripsRepository _myTripsRepository;

  ShareTripUseCase(this._myTripsRepository);

  Future<Either<Failure, Trip>> call(ShareTripRequestModel request) async {
    return _myTripsRepository.shareTrip(request);
  }
}
