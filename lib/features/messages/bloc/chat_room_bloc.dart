import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/messages/domain/models/chat_room_model.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';
import 'package:unipool/features/messages/domain/models/room_model.dart';
import 'package:unipool/features/messages/domain/use_cases/create_room_use_case.dart';
import 'package:unipool/features/messages/domain/use_cases/delete_room_use_case.dart';
import 'package:unipool/features/messages/domain/use_cases/get_room_messages_use_case.dart';
import 'package:unipool/features/messages/domain/use_cases/get_user_rooms_use_case.dart';
import 'package:unipool/features/messages/domain/use_cases/send_message_use_case.dart';

part 'chat_room_event.dart';
part 'chat_room_state.dart';

@injectable
class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final GetRoomMessagesUseCase _getRoomMessages;
  final SendMessageUseCase _sendMessage;
  final CreateDirectMessageRoomUseCase _createDirectMessageRoom;
  final GetUserRoomsUseCase _getUserRooms;
  final DeleteRoomUseCase _deleteRoom;

  StreamSubscription<List<Message>>? _messagesSubscription;
  StreamSubscription<List<Room>>? _roomsSubscription;
  ChatRoomBloc(
    this._getRoomMessages,
    this._sendMessage,
    this._createDirectMessageRoom,
    this._getUserRooms,
    this._deleteRoom,
  ) : super(const ChatRoomInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<CreateDirectMessageRoom>(_onCreateDirectMessageRoom);
    on<CreateDirectMessageRoomSendMessage>(_onCreateDirectMessageRoomSendMessage);
    on<LoadUserRooms>(_onLoadUserRooms);
    on<MessagesUpdated>(_onMessagesUpdated);
    on<RoomsUpdated>(_onRoomsUpdated);
    on<DeleteRoom>(_onDeleteRoom);
  }

  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(const ChatRoomLoading());

    await _messagesSubscription?.cancel();
    final messages = _getRoomMessages.call(event.roomId);

    emit(ChatRoomMessagesLoaded(messages, event.roomId));
  }

  Future<void> _onLoadUserRooms(
    LoadUserRooms event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(const ChatRoomLoading());
    await _roomsSubscription?.cancel();
    final rooms = await _getUserRooms.call(event.profileId);

    rooms.fold(
      (failure) => emit(
        ChatRoomError(
          failure.message,
        ),
      ),
      (rooms) => add(
        RoomsUpdated(
          rooms,
        ),
      ),
    );
  }

  void _onMessagesUpdated(
    MessagesUpdated event,
    Emitter<ChatRoomState> emit,
  ) {
    emit(ChatRoomMessagesLoaded(event.messages, event.roomId));
  }

  void _onRoomsUpdated(
    RoomsUpdated event,
    Emitter<ChatRoomState> emit,
  ) {
    emit(ChatRoomListLoaded(event.rooms));
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatRoomState> emit,
  ) async {
    final result = await _sendMessage.call(
      profileId: event.profileId,
      roomId: event.roomId,
      content: event.content,
    );

    result.fold(
      (failure) => emit(
        ChatRoomError(
          failure.message,
        ),
      ),
      (_) => null, // Messages will be updated via stream
    );
  }

  Future<void> _onCreateDirectMessageRoomSendMessage(
    CreateDirectMessageRoomSendMessage event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(
      const ChatRoomLoading(),
    );

    final result = await _createDirectMessageRoom.call(
      currentUserId: event.currentUserId,
      otherUserId: event.otherUserId,
    );

    result.fold(
      (failure) => emit(
        ChatRoomError(
          failure.message,
        ),
      ),
      (room) {
        add(LoadUserRooms(event.currentUserId.toString()));
        add(
          SendMessage(
            profileId: event.currentUserId,
            roomId: room,
            content: event.content,
          ),
        );
      },
    );
  }

  Future<void> _onCreateDirectMessageRoom(
    CreateDirectMessageRoom event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(
      const ChatRoomLoading(),
    );

    final result = await _createDirectMessageRoom.call(
      currentUserId: event.currentUserId,
      otherUserId: event.otherUserId,
    );

    result.fold(
      (failure) => emit(
        ChatRoomError(
          failure.message,
        ),
      ),
      (room) => add(
        LoadUserRooms(event.currentUserId.toString()),
      ),
    );
  }

  Future<void> _onDeleteRoom(
    DeleteRoom event,
    Emitter<ChatRoomState> emit,
  ) async {
    final response = await _deleteRoom.call(event.roomId);

    response.fold(
      (failure) => emit(ChatRoomError(failure.message)),
      (_) => add(LoadUserRooms(event.currentUserId.toString())),
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    _roomsSubscription?.cancel();
    return super.close();
  }
}
