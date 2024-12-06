import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:either_dart/either.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';
import 'package:unipool/features/messages/domain/models/room_model.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part '../data/messages_repository_impl.dart';

abstract class MessagesRepository {
  // Room operations
  Future<Either<Failure, String>> createRoom(String otherUserId);
  Future<Either<Failure, void>> addParticipantToRoom({
    required String roomId,
    required String profileId,
  });
  Future<Either<Failure, List<Room>>> getUserRooms(String profileId);

  // Message operations
  Future<Either<Failure, Message>> sendMessage({
    required String profileId,
    required String roomId,
    required String content,
  });
  Future<Either<Failure, List<Message>>> getRoomMessages(String roomId);
  Future<Either<Failure, void>> deleteMessage(String messageId);
  Future<Either<Failure, void>> deleteRoom(String roomId);

  // Realtime streams
  Stream<List<Message>> getRoomMessagesStream(String roomId);
  Stream<List<Room>> getUserRoomsStream(String profileId);

  // Room participants
  Future<Either<Failure, List<String>>> getRoomParticipants(String roomId);
  Future<Either<Failure, bool>> isUserInRoom({
    required String roomId,
    required String profileId,
  });
}
