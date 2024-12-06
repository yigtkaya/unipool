part of 'chat_room_bloc.dart';

abstract class ChatRoomEvent extends Equatable {
  const ChatRoomEvent();

  @override
  List<Object?> get props => [];
}

class DeleteRoom extends ChatRoomEvent {
  final String roomId;
  final String currentUserId;

  const DeleteRoom({
    required this.roomId,
    required this.currentUserId,
  });

  @override
  List<Object?> get props => [roomId, currentUserId];
}

class LoadMessages extends ChatRoomEvent {
  final String roomId;

  const LoadMessages(this.roomId);

  @override
  List<Object?> get props => [roomId];
}

class LoadUserRooms extends ChatRoomEvent {
  final String profileId;

  const LoadUserRooms(this.profileId);

  @override
  List<Object?> get props => [profileId];
}

class SendMessage extends ChatRoomEvent {
  final String profileId;
  final String roomId;
  final String content;

  const SendMessage({
    required this.profileId,
    required this.roomId,
    required this.content,
  });

  @override
  List<Object?> get props => [profileId, roomId, content];
}

class CreateDirectMessageRoom extends ChatRoomEvent {
  final String currentUserId;
  final String otherUserId;

  const CreateDirectMessageRoom({
    required this.currentUserId,
    required this.otherUserId,
  });

  @override
  List<Object?> get props => [currentUserId, otherUserId];
}

class CreateDirectMessageRoomSendMessage extends ChatRoomEvent {
  final String currentUserId;
  final String otherUserId;
  final String content;

  const CreateDirectMessageRoomSendMessage({
    required this.currentUserId,
    required this.otherUserId,
    required this.content,
  });

  @override
  List<Object?> get props => [currentUserId, otherUserId];
}

class MessagesUpdated extends ChatRoomEvent {
  final Stream<List<Message>> messages;
  final String roomId;

  const MessagesUpdated(this.messages, this.roomId);

  @override
  List<Object?> get props => [messages, roomId];
}

class RoomsUpdated extends ChatRoomEvent {
  final List<Room> rooms;

  const RoomsUpdated(this.rooms);

  @override
  List<Object?> get props => [rooms];
}

class ChatRoomErrorEvent extends ChatRoomEvent {
  final String message;

  const ChatRoomErrorEvent(this.message);

  @override
  List<Object?> get props => [message];
}
