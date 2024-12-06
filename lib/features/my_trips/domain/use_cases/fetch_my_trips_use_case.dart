import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/repository/my_trips_repository.dart';

@injectable
class FetchMyTripsUseCase {
  final MyTripsRepository _myTripsRepository;

  FetchMyTripsUseCase(this._myTripsRepository);

  Future<Either<Failure, List<TripsResponseModel>>> call(String userId) async {
    return _myTripsRepository.getMyTrips(userId);
  }
}
