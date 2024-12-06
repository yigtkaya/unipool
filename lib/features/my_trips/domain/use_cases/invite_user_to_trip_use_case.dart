import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
import 'package:unipool/features/my_trips/domain/repository/my_trips_repository.dart';

@injectable
final class InviteUserToTripUseCase {
  final MyTripsRepository _repository;

  InviteUserToTripUseCase(this._repository);

  Future<Either<Failure, String>> call(InviteModel request) async {
    return await _repository.invite(request);
  }
}
