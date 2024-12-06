part of '../domain/messages_repository.dart';

@Injectable(as: MessagesRepository)
final class MessagesRepositoryImpl implements MessagesRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, String>> createRoom(String otherUserId) async {
    try {
      final response = await _supabase.rpc(
        'create_new_room',
        params: {
          'other_user_id': otherUserId,
        },
      );

      return Right(response);
    } catch (e) {
      return Left(Failure(message: 'Failed to create room: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, void>> addParticipantToRoom({
    required String roomId,
    required String profileId,
  }) async {
    try {
      await _supabase.from('room_participants').insert({
        'room_id': roomId,
        'profile_id': profileId,
        'created_at': DateTime.now().toIso8601String(),
      });

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to add participant: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, List<Room>>> getUserRooms(String profileId) async {
    try {
      final response = await _supabase.from('rooms').select('''
          *,
          lastMessage:messages!rooms_lastMessage_fkey(*),
          room_participants!inner (
            profile_id
          ),
          participants:room_participants (
            profile:profiles (
              id,
              name,
              surname,
              profilePhoto
            )
          )
        ''').eq('room_participants.profile_id', profileId).order('created_at', ascending: false);

      if (response.isEmpty) {
        return const Right([]);
      }

      final rooms = (response as List).map((json) {
        final lastMessage = json['lastMessage'];
        final participants = (json['participants'] as List)
            .where((p) => p['profile']['id'] != profileId) // Filter out current user
            .map((p) => ProfileModelMapper.fromMap(p['profile']))
            .toList();

        return Room(
          id: json['id'],
          createdAt: DateTime.parse(json['created_at']),
          lastMessage: lastMessage != null ? MessageMapper.fromMap(lastMessage) : null,
          otherParticipant: participants.isNotEmpty ? participants.first : null,
        );
      }).toList();

      return Right(rooms);
    } catch (e) {
      return Left(Failure(message: 'Failed to get user rooms: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, Message>> sendMessage({
    required String profileId,
    required String roomId,
    required String content,
  }) async {
    try {
      final response = await _supabase
          .from('messages')
          .insert({
            'profile_id': profileId,
            'room_id': roomId,
            'content': content,
            'created_at': DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      await _supabase.from('rooms').update({
        'lastMessage': response['id'],
      }).eq('id', roomId);

      return Right(
        MessageMapper.fromMap(
          response,
        ),
      );
    } catch (e) {
      return Left(Failure(message: 'Failed to send message: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getRoomMessages(String roomId) async {
    try {
      final response = await _supabase.from('messages').select().eq('room_id', roomId).order('created_at');

      final messages = (response as List).map((json) => MessageMapper.fromMap(json)).toList();

      return Right(messages);
    } catch (e) {
      return Left(Failure(message: 'Failed to get messages: $e', code: ''));
    }
  }

  @override
  Stream<List<Message>> getRoomMessagesStream(String roomId) {
    return _supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('room_id', roomId)
        .order('created_at')
        .map((rows) => rows.map((row) => MessageMapper.fromMap(row)).toList());
  }

  @override
  Stream<List<Room>> getUserRoomsStream(String profileId) {
    return _supabase
        .from('rooms')
        .stream(primaryKey: ['id'])
        .eq('room_participants.profile_id', profileId)
        .map((rows) async {
          final rooms = await Future.wait(
            rows.map((row) async {
              // Create a stream for each room's last message
              final messageStream = _supabase
                  .from('messages')
                  .stream(primaryKey: ['id'])
                  .eq('room_id', row['id'])
                  .order('created_at', ascending: false)
                  .limit(1);

              // Subscribe to message changes
              final lastMessage = await messageStream.first;
              final lastMessageData = lastMessage.isNotEmpty ? lastMessage.first : null;

              // Fetch participants
              final participantsResponse = await _supabase
                  .from('room_participants')
                  .select('profile:profiles(id, name, surname, profilePhoto)')
                  .eq('room_id', row['id']);

              final participants = (participantsResponse as List)
                  .map((p) => p['profile'])
                  .where((p) => p['id'] != profileId)
                  .map((p) => ProfileModelMapper.fromMap(p))
                  .toList();

              return Room(
                id: row['id'],
                createdAt: DateTime.parse(row['created_at']),
                lastMessage: lastMessageData != null ? MessageMapper.fromMap(lastMessageData) : null,
                otherParticipant: participants.isNotEmpty ? participants.first : null,
              );
            }),
          );

          // Sort rooms by last message timestamp
          rooms.sort((a, b) {
            final aTime = a.lastMessage?.createdAt ?? a.createdAt;
            final bTime = b.lastMessage?.createdAt ?? b.createdAt;
            return bTime.compareTo(aTime); // Most recent first
          });

          return rooms;
        })
        .asyncMap((event) => event);
  }

  @override
  Future<Either<Failure, void>> deleteMessage(String messageId) async {
    try {
      await _supabase.from('messages').delete().eq('id', messageId);

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to delete message: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getRoomParticipants(String roomId) async {
    try {
      final response = await _supabase.from('room_participants').select('profile_id').eq('room_id', roomId);

      final participants = (response as List).map((row) => row['profile_id'] as String).toList();

      return Right(participants);
    } catch (e) {
      return Left(Failure(message: 'Failed to get room participants: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, bool>> isUserInRoom({
    required String roomId,
    required String profileId,
  }) async {
    try {
      final response =
          await _supabase.from('room_participants').select().eq('room_id', roomId).eq('profile_id', profileId).limit(1);

      return Right((response as List).isNotEmpty);
    } catch (e) {
      return Left(Failure(message: 'Failed to check room participation: $e', code: ''));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRoom(String roomId) async {
    try {
      await _supabase.from('rooms').delete().eq('id', roomId);

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to delete room: $e', code: ''));
    }
  }
}
