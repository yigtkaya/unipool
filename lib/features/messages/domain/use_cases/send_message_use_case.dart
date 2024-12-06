import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/messages/domain/messages_repository.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';

@injectable
final class SendMessageUseCase {
  final MessagesRepository _repository;

  const SendMessageUseCase(this._repository);

  Future<Either<Failure, Message>> call({
    required String profileId,
    required String roomId,
    required String content,
  }) async {
    return _repository.sendMessage(
      profileId: profileId,
      roomId: roomId,
      content: content,
    );
  }
}
