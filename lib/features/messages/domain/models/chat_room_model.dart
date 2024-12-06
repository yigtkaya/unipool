import 'package:unipool/features/messages/domain/models/message_model.dart';
import 'package:unipool/features/messages/domain/models/room_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'chat_room_model.mapper.dart';

@MappableClass()
class ChatRoom with ChatRoomMappable {
  final Room room;
  final List<String> participantIds;
  final List<Message> messages;

  const ChatRoom({
    required this.room,
    required this.participantIds,
    this.messages = const [],
  });
}
