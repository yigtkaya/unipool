import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/messages/domain/messages_repository.dart';

@injectable
final class DeleteRoomUseCase {
  final MessagesRepository _repository;

  const DeleteRoomUseCase(this._repository);

  Future<Either<Failure, void>> call(String roomId) async {
    return _repository.deleteRoom(roomId);
  }
}
