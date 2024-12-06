// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'share_trip_request_model.dart';

class ShareTripRequestModelMapper extends ClassMapperBase<ShareTripRequestModel> {
  ShareTripRequestModelMapper._();

  static ShareTripRequestModelMapper? _instance;
  static ShareTripRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShareTripRequestModelMapper._());
      GeoapifyPlaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ShareTripRequestModel';

  static GeoapifyPlace _$startDestination(ShareTripRequestModel v) => v.startDestination;
  static const Field<ShareTripRequestModel, GeoapifyPlace> _f$startDestination =
      Field('startDestination', _$startDestination, key: 'start_destination');
  static GeoapifyPlace _$finalDestination(ShareTripRequestModel v) => v.finalDestination;
  static const Field<ShareTripRequestModel, GeoapifyPlace> _f$finalDestination =
      Field('finalDestination', _$finalDestination, key: 'final_destination');
  static String _$type(ShareTripRequestModel v) => v.type;
  static const Field<ShareTripRequestModel, String> _f$type = Field('type', _$type);
  static String? _$departureTime(ShareTripRequestModel v) => v.departureTime;
  static const Field<ShareTripRequestModel, String> _f$departureTime = Field('departureTime', _$departureTime);
  static int? _$passengerLimit(ShareTripRequestModel v) => v.passengerLimit;
  static const Field<ShareTripRequestModel, int> _f$passengerLimit = Field('passengerLimit', _$passengerLimit);
  static String _$status(ShareTripRequestModel v) => v.status;
  static const Field<ShareTripRequestModel, String> _f$status = Field('status', _$status);
  static String? _$createdBy(ShareTripRequestModel v) => v.createdBy;
  static const Field<ShareTripRequestModel, String> _f$createdBy = Field('createdBy', _$createdBy, key: 'created_by');
  static String? _$createdAt(ShareTripRequestModel v) => v.createdAt;
  static const Field<ShareTripRequestModel, String> _f$createdAt = Field('createdAt', _$createdAt);

  @override
  final MappableFields<ShareTripRequestModel> fields = const {
    #startDestination: _f$startDestination,
    #finalDestination: _f$finalDestination,
    #type: _f$type,
    #departureTime: _f$departureTime,
    #passengerLimit: _f$passengerLimit,
    #status: _f$status,
    #createdBy: _f$createdBy,
    #createdAt: _f$createdAt,
  };

  static ShareTripRequestModel _instantiate(DecodingData data) {
    return ShareTripRequestModel(
        startDestination: data.dec(_f$startDestination),
        finalDestination: data.dec(_f$finalDestination),
        type: data.dec(_f$type),
        departureTime: data.dec(_f$departureTime),
        passengerLimit: data.dec(_f$passengerLimit),
        status: data.dec(_f$status),
        createdBy: data.dec(_f$createdBy),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static ShareTripRequestModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ShareTripRequestModel>(map);
  }

  static ShareTripRequestModel fromJson(String json) {
    return ensureInitialized().decodeJson<ShareTripRequestModel>(json);
  }
}

mixin ShareTripRequestModelMappable {
  String toJson() {
    return ShareTripRequestModelMapper.ensureInitialized()
        .encodeJson<ShareTripRequestModel>(this as ShareTripRequestModel);
  }

  Map<String, dynamic> toMap() {
    return ShareTripRequestModelMapper.ensureInitialized()
        .encodeMap<ShareTripRequestModel>(this as ShareTripRequestModel);
  }

  ShareTripRequestModelCopyWith<ShareTripRequestModel, ShareTripRequestModel, ShareTripRequestModel> get copyWith =>
      _ShareTripRequestModelCopyWithImpl(this as ShareTripRequestModel, $identity, $identity);
  @override
  String toString() {
    return ShareTripRequestModelMapper.ensureInitialized().stringifyValue(this as ShareTripRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return ShareTripRequestModelMapper.ensureInitialized().equalsValue(this as ShareTripRequestModel, other);
  }

  @override
  int get hashCode {
    return ShareTripRequestModelMapper.ensureInitialized().hashValue(this as ShareTripRequestModel);
  }
}

extension ShareTripRequestModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ShareTripRequestModel, $Out> {
  ShareTripRequestModelCopyWith<$R, ShareTripRequestModel, $Out> get $asShareTripRequestModel =>
      $base.as((v, t, t2) => _ShareTripRequestModelCopyWithImpl(v, t, t2));
}

abstract class ShareTripRequestModelCopyWith<$R, $In extends ShareTripRequestModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get startDestination;
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get finalDestination;
  $R call(
      {GeoapifyPlace? startDestination,
      GeoapifyPlace? finalDestination,
      String? type,
      String? departureTime,
      int? passengerLimit,
      String? status,
      String? createdBy,
      String? createdAt});
  ShareTripRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ShareTripRequestModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ShareTripRequestModel, $Out>
    implements ShareTripRequestModelCopyWith<$R, ShareTripRequestModel, $Out> {
  _ShareTripRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ShareTripRequestModel> $mapper = ShareTripRequestModelMapper.ensureInitialized();
  @override
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get startDestination =>
      $value.startDestination.copyWith.$chain((v) => call(startDestination: v));
  @override
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get finalDestination =>
      $value.finalDestination.copyWith.$chain((v) => call(finalDestination: v));
  @override
  $R call(
          {GeoapifyPlace? startDestination,
          GeoapifyPlace? finalDestination,
          String? type,
          Object? departureTime = $none,
          Object? passengerLimit = $none,
          String? status,
          Object? createdBy = $none,
          Object? createdAt = $none}) =>
      $apply(FieldCopyWithData({
        if (startDestination != null) #startDestination: startDestination,
        if (finalDestination != null) #finalDestination: finalDestination,
        if (type != null) #type: type,
        if (departureTime != $none) #departureTime: departureTime,
        if (passengerLimit != $none) #passengerLimit: passengerLimit,
        if (status != null) #status: status,
        if (createdBy != $none) #createdBy: createdBy,
        if (createdAt != $none) #createdAt: createdAt
      }));
  @override
  ShareTripRequestModel $make(CopyWithData data) => ShareTripRequestModel(
      startDestination: data.get(#startDestination, or: $value.startDestination),
      finalDestination: data.get(#finalDestination, or: $value.finalDestination),
      type: data.get(#type, or: $value.type),
      departureTime: data.get(#departureTime, or: $value.departureTime),
      passengerLimit: data.get(#passengerLimit, or: $value.passengerLimit),
      status: data.get(#status, or: $value.status),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  ShareTripRequestModelCopyWith<$R2, ShareTripRequestModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ShareTripRequestModelCopyWithImpl($value, $cast, t);
}
