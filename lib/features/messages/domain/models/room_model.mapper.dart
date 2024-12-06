// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'room_model.dart';

class RoomMapper extends ClassMapperBase<Room> {
  RoomMapper._();

  static RoomMapper? _instance;
  static RoomMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoomMapper._());
      MessageMapper.ensureInitialized();
      ProfileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Room';

  static String _$id(Room v) => v.id;
  static const Field<Room, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(Room v) => v.createdAt;
  static const Field<Room, DateTime> _f$createdAt = Field('createdAt', _$createdAt);
  static Message? _$lastMessage(Room v) => v.lastMessage;
  static const Field<Room, Message> _f$lastMessage = Field('lastMessage', _$lastMessage, opt: true);
  static ProfileModel? _$otherParticipant(Room v) => v.otherParticipant;
  static const Field<Room, ProfileModel> _f$otherParticipant = Field('otherParticipant', _$otherParticipant, opt: true);

  @override
  final MappableFields<Room> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #lastMessage: _f$lastMessage,
    #otherParticipant: _f$otherParticipant,
  };

  static Room _instantiate(DecodingData data) {
    return Room(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        lastMessage: data.dec(_f$lastMessage),
        otherParticipant: data.dec(_f$otherParticipant));
  }

  @override
  final Function instantiate = _instantiate;

  static Room fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Room>(map);
  }

  static Room fromJson(String json) {
    return ensureInitialized().decodeJson<Room>(json);
  }
}

mixin RoomMappable {
  String toJson() {
    return RoomMapper.ensureInitialized().encodeJson<Room>(this as Room);
  }

  Map<String, dynamic> toMap() {
    return RoomMapper.ensureInitialized().encodeMap<Room>(this as Room);
  }

  RoomCopyWith<Room, Room, Room> get copyWith => _RoomCopyWithImpl(this as Room, $identity, $identity);
  @override
  String toString() {
    return RoomMapper.ensureInitialized().stringifyValue(this as Room);
  }

  @override
  bool operator ==(Object other) {
    return RoomMapper.ensureInitialized().equalsValue(this as Room, other);
  }

  @override
  int get hashCode {
    return RoomMapper.ensureInitialized().hashValue(this as Room);
  }
}

extension RoomValueCopy<$R, $Out> on ObjectCopyWith<$R, Room, $Out> {
  RoomCopyWith<$R, Room, $Out> get $asRoom => $base.as((v, t, t2) => _RoomCopyWithImpl(v, t, t2));
}

abstract class RoomCopyWith<$R, $In extends Room, $Out> implements ClassCopyWith<$R, $In, $Out> {
  MessageCopyWith<$R, Message, Message>? get lastMessage;
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel>? get otherParticipant;
  $R call({String? id, DateTime? createdAt, Message? lastMessage, ProfileModel? otherParticipant});
  RoomCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RoomCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Room, $Out> implements RoomCopyWith<$R, Room, $Out> {
  _RoomCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Room> $mapper = RoomMapper.ensureInitialized();
  @override
  MessageCopyWith<$R, Message, Message>? get lastMessage =>
      $value.lastMessage?.copyWith.$chain((v) => call(lastMessage: v));
  @override
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel>? get otherParticipant =>
      $value.otherParticipant?.copyWith.$chain((v) => call(otherParticipant: v));
  @override
  $R call({String? id, DateTime? createdAt, Object? lastMessage = $none, Object? otherParticipant = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (lastMessage != $none) #lastMessage: lastMessage,
        if (otherParticipant != $none) #otherParticipant: otherParticipant
      }));
  @override
  Room $make(CopyWithData data) => Room(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      lastMessage: data.get(#lastMessage, or: $value.lastMessage),
      otherParticipant: data.get(#otherParticipant, or: $value.otherParticipant));

  @override
  RoomCopyWith<$R2, Room, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _RoomCopyWithImpl($value, $cast, t);
}
