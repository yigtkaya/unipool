import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'room_model.mapper.dart';

@MappableClass()
class Room with RoomMappable {
  final String id;
  final Message? lastMessage;
  final DateTime createdAt;
  final ProfileModel? otherParticipant;
  Room({
    required this.id,
    required this.createdAt,
    this.lastMessage,
    this.otherParticipant,
  });
}
