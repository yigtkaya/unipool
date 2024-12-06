import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/messages/domain/messages_repository.dart';
import 'package:unipool/features/messages/domain/models/room_model.dart';

@injectable
final class GetUserRoomsUseCase {
  final MessagesRepository _repository;

  const GetUserRoomsUseCase(this._repository);

  Future<Either<Failure, List<Room>>> call(String profileId) async {
    return _repository.getUserRooms(profileId);
  }
}
