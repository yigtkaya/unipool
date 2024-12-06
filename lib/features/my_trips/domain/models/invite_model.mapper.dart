// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'invite_model.dart';

class InviteModelMapper extends ClassMapperBase<InviteModel> {
  InviteModelMapper._();

  static InviteModelMapper? _instance;
  static InviteModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InviteModelMapper._());
      ProfileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InviteModel';

  static String? _$id(InviteModel v) => v.id;
  static const Field<InviteModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$inviterId(InviteModel v) => v.inviterId;
  static const Field<InviteModel, String> _f$inviterId = Field('inviterId', _$inviterId, key: 'inviter_id', opt: true);
  static String? _$inviterTripId(InviteModel v) => v.inviterTripId;
  static const Field<InviteModel, String> _f$inviterTripId =
      Field('inviterTripId', _$inviterTripId, key: 'inviter_trip_id', opt: true);
  static String? _$inviteeId(InviteModel v) => v.inviteeId;
  static const Field<InviteModel, String> _f$inviteeId = Field('inviteeId', _$inviteeId, key: 'invitee_id', opt: true);
  static ProfileModel? _$inviter(InviteModel v) => v.inviter;
  static const Field<InviteModel, ProfileModel> _f$inviter = Field('inviter', _$inviter, opt: true);
  static String? _$inviteeTripId(InviteModel v) => v.inviteeTripId;
  static const Field<InviteModel, String> _f$inviteeTripId =
      Field('inviteeTripId', _$inviteeTripId, key: 'invitee_trip_id', opt: true);
  static bool? _$isAccepted(InviteModel v) => v.isAccepted;
  static const Field<InviteModel, bool> _f$isAccepted = Field('isAccepted', _$isAccepted, opt: true);

  @override
  final MappableFields<InviteModel> fields = const {
    #id: _f$id,
    #inviterId: _f$inviterId,
    #inviterTripId: _f$inviterTripId,
    #inviteeId: _f$inviteeId,
    #inviter: _f$inviter,
    #inviteeTripId: _f$inviteeTripId,
    #isAccepted: _f$isAccepted,
  };
  @override
  final bool ignoreNull = true;

  static InviteModel _instantiate(DecodingData data) {
    return InviteModel(
        id: data.dec(_f$id),
        inviterId: data.dec(_f$inviterId),
        inviterTripId: data.dec(_f$inviterTripId),
        inviteeId: data.dec(_f$inviteeId),
        inviter: data.dec(_f$inviter),
        inviteeTripId: data.dec(_f$inviteeTripId),
        isAccepted: data.dec(_f$isAccepted));
  }

  @override
  final Function instantiate = _instantiate;

  static InviteModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InviteModel>(map);
  }

  static InviteModel fromJson(String json) {
    return ensureInitialized().decodeJson<InviteModel>(json);
  }
}

mixin InviteModelMappable {
  String toJson() {
    return InviteModelMapper.ensureInitialized().encodeJson<InviteModel>(this as InviteModel);
  }

  Map<String, dynamic> toMap() {
    return InviteModelMapper.ensureInitialized().encodeMap<InviteModel>(this as InviteModel);
  }

  InviteModelCopyWith<InviteModel, InviteModel, InviteModel> get copyWith =>
      _InviteModelCopyWithImpl(this as InviteModel, $identity, $identity);
  @override
  String toString() {
    return InviteModelMapper.ensureInitialized().stringifyValue(this as InviteModel);
  }

  @override
  bool operator ==(Object other) {
    return InviteModelMapper.ensureInitialized().equalsValue(this as InviteModel, other);
  }

  @override
  int get hashCode {
    return InviteModelMapper.ensureInitialized().hashValue(this as InviteModel);
  }
}

extension InviteModelValueCopy<$R, $Out> on ObjectCopyWith<$R, InviteModel, $Out> {
  InviteModelCopyWith<$R, InviteModel, $Out> get $asInviteModel =>
      $base.as((v, t, t2) => _InviteModelCopyWithImpl(v, t, t2));
}

abstract class InviteModelCopyWith<$R, $In extends InviteModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel>? get inviter;
  $R call(
      {String? id,
      String? inviterId,
      String? inviterTripId,
      String? inviteeId,
      ProfileModel? inviter,
      String? inviteeTripId,
      bool? isAccepted});
  InviteModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InviteModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, InviteModel, $Out>
    implements InviteModelCopyWith<$R, InviteModel, $Out> {
  _InviteModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InviteModel> $mapper = InviteModelMapper.ensureInitialized();
  @override
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel>? get inviter =>
      $value.inviter?.copyWith.$chain((v) => call(inviter: v));
  @override
  $R call(
          {Object? id = $none,
          Object? inviterId = $none,
          Object? inviterTripId = $none,
          Object? inviteeId = $none,
          Object? inviter = $none,
          Object? inviteeTripId = $none,
          Object? isAccepted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (inviterId != $none) #inviterId: inviterId,
        if (inviterTripId != $none) #inviterTripId: inviterTripId,
        if (inviteeId != $none) #inviteeId: inviteeId,
        if (inviter != $none) #inviter: inviter,
        if (inviteeTripId != $none) #inviteeTripId: inviteeTripId,
        if (isAccepted != $none) #isAccepted: isAccepted
      }));
  @override
  InviteModel $make(CopyWithData data) => InviteModel(
      id: data.get(#id, or: $value.id),
      inviterId: data.get(#inviterId, or: $value.inviterId),
      inviterTripId: data.get(#inviterTripId, or: $value.inviterTripId),
      inviteeId: data.get(#inviteeId, or: $value.inviteeId),
      inviter: data.get(#inviter, or: $value.inviter),
      inviteeTripId: data.get(#inviteeTripId, or: $value.inviteeTripId),
      isAccepted: data.get(#isAccepted, or: $value.isAccepted));

  @override
  InviteModelCopyWith<$R2, InviteModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InviteModelCopyWithImpl($value, $cast, t);
}
