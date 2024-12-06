part of 'chat_room_bloc.dart';

abstract class ChatRoomState extends Equatable {
  const ChatRoomState();

  @override
  List<Object?> get props => [];
}

class ChatRoomInitial extends ChatRoomState {
  const ChatRoomInitial();
}

class ChatRoomLoading extends ChatRoomState {
  const ChatRoomLoading();
}

class ChatRoomMessagesLoaded extends ChatRoomState {
  final Stream<List<Message>> messages;
  final String roomId;

  const ChatRoomMessagesLoaded(this.messages, this.roomId);

  @override
  List<Object?> get props => [messages, roomId];
}

class ChatRoomListLoaded extends ChatRoomState {
  final List<Room> rooms;

  const ChatRoomListLoaded(this.rooms);

  @override
  List<Object?> get props => [rooms];
}

class ChatRoomCreated extends ChatRoomState {
  final ChatRoom chatRoom;

  const ChatRoomCreated(this.chatRoom);

  @override
  List<Object?> get props => [chatRoom];
}

class ChatRoomError extends ChatRoomState {
  final String message;

  const ChatRoomError(this.message);

  @override
  List<Object?> get props => [message];
}
