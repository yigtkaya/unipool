import 'package:injectable/injectable.dart';
import 'package:unipool/features/messages/domain/messages_repository.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';

@injectable
class GetRoomMessagesUseCase {
  final MessagesRepository _repository;

  const GetRoomMessagesUseCase(this._repository);

  Stream<List<Message>> call(String roomId) {
    return _repository.getRoomMessagesStream(roomId);
  }
}
