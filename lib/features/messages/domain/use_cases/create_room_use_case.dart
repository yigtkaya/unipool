import 'package:either_dart/either.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/messages/domain/messages_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateDirectMessageRoomUseCase {
  final MessagesRepository _repository;

  const CreateDirectMessageRoomUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String currentUserId,
    required String otherUserId,
  }) async {
    return await _repository.createRoom(otherUserId);
  }
}
