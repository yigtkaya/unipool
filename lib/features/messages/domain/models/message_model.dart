import 'package:dart_mappable/dart_mappable.dart';

part 'message_model.mapper.dart';

@MappableClass()
class Message with MessageMappable {
  final String id;
  final String content;
  @MappableField(key: 'profile_id')
  final String profileId;
  @MappableField(key: 'room_id')
  final String roomId;
  @MappableField(key: 'created_at')
  final DateTime createdAt;

  const Message({
    required this.id,
    required this.content,
    required this.profileId,
    required this.roomId,
    required this.createdAt,
  });
}
