// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_room_model.dart';

class ChatRoomMapper extends ClassMapperBase<ChatRoom> {
  ChatRoomMapper._();

  static ChatRoomMapper? _instance;
  static ChatRoomMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatRoomMapper._());
      RoomMapper.ensureInitialized();
      MessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatRoom';

  static Room _$room(ChatRoom v) => v.room;
  static const Field<ChatRoom, Room> _f$room = Field('room', _$room);
  static List<String> _$participantIds(ChatRoom v) => v.participantIds;
  static const Field<ChatRoom, List<String>> _f$participantIds = Field('participantIds', _$participantIds);
  static List<Message> _$messages(ChatRoom v) => v.messages;
  static const Field<ChatRoom, List<Message>> _f$messages = Field('messages', _$messages, opt: true, def: const []);

  @override
  final MappableFields<ChatRoom> fields = const {
    #room: _f$room,
    #participantIds: _f$participantIds,
    #messages: _f$messages,
  };

  static ChatRoom _instantiate(DecodingData data) {
    return ChatRoom(
        room: data.dec(_f$room), participantIds: data.dec(_f$participantIds), messages: data.dec(_f$messages));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatRoom fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatRoom>(map);
  }

  static ChatRoom fromJson(String json) {
    return ensureInitialized().decodeJson<ChatRoom>(json);
  }
}

mixin ChatRoomMappable {
  String toJson() {
    return ChatRoomMapper.ensureInitialized().encodeJson<ChatRoom>(this as ChatRoom);
  }

  Map<String, dynamic> toMap() {
    return ChatRoomMapper.ensureInitialized().encodeMap<ChatRoom>(this as ChatRoom);
  }

  ChatRoomCopyWith<ChatRoom, ChatRoom, ChatRoom> get copyWith =>
      _ChatRoomCopyWithImpl(this as ChatRoom, $identity, $identity);
  @override
  String toString() {
    return ChatRoomMapper.ensureInitialized().stringifyValue(this as ChatRoom);
  }

  @override
  bool operator ==(Object other) {
    return ChatRoomMapper.ensureInitialized().equalsValue(this as ChatRoom, other);
  }

  @override
  int get hashCode {
    return ChatRoomMapper.ensureInitialized().hashValue(this as ChatRoom);
  }
}

extension ChatRoomValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatRoom, $Out> {
  ChatRoomCopyWith<$R, ChatRoom, $Out> get $asChatRoom => $base.as((v, t, t2) => _ChatRoomCopyWithImpl(v, t, t2));
}

abstract class ChatRoomCopyWith<$R, $In extends ChatRoom, $Out> implements ClassCopyWith<$R, $In, $Out> {
  RoomCopyWith<$R, Room, Room> get room;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get participantIds;
  ListCopyWith<$R, Message, MessageCopyWith<$R, Message, Message>> get messages;
  $R call({Room? room, List<String>? participantIds, List<Message>? messages});
  ChatRoomCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatRoomCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ChatRoom, $Out>
    implements ChatRoomCopyWith<$R, ChatRoom, $Out> {
  _ChatRoomCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatRoom> $mapper = ChatRoomMapper.ensureInitialized();
  @override
  RoomCopyWith<$R, Room, Room> get room => $value.room.copyWith.$chain((v) => call(room: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get participantIds =>
      ListCopyWith($value.participantIds, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(participantIds: v));
  @override
  ListCopyWith<$R, Message, MessageCopyWith<$R, Message, Message>> get messages =>
      ListCopyWith($value.messages, (v, t) => v.copyWith.$chain(t), (v) => call(messages: v));
  @override
  $R call({Room? room, List<String>? participantIds, List<Message>? messages}) => $apply(FieldCopyWithData({
        if (room != null) #room: room,
        if (participantIds != null) #participantIds: participantIds,
        if (messages != null) #messages: messages
      }));
  @override
  ChatRoom $make(CopyWithData data) => ChatRoom(
      room: data.get(#room, or: $value.room),
      participantIds: data.get(#participantIds, or: $value.participantIds),
      messages: data.get(#messages, or: $value.messages));

  @override
  ChatRoomCopyWith<$R2, ChatRoom, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatRoomCopyWithImpl($value, $cast, t);
}
