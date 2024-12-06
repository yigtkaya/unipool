// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'trip_model.dart';

class TripStatusMapper extends EnumMapper<TripStatus> {
  TripStatusMapper._();

  static TripStatusMapper? _instance;
  static TripStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TripStatusMapper._());
    }
    return _instance!;
  }

  static TripStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TripStatus decode(dynamic value) {
    switch (value) {
      case 'active':
        return TripStatus.active;
      case 'ongoing':
        return TripStatus.ongoing;
      case 'past':
        return TripStatus.past;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TripStatus self) {
    switch (self) {
      case TripStatus.active:
        return 'active';
      case TripStatus.ongoing:
        return 'ongoing';
      case TripStatus.past:
        return 'past';
    }
  }
}

extension TripStatusMapperExtension on TripStatus {
  String toValue() {
    TripStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TripStatus>(this) as String;
  }
}

class TripTypeMapper extends EnumMapper<TripType> {
  TripTypeMapper._();

  static TripTypeMapper? _instance;
  static TripTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TripTypeMapper._());
    }
    return _instance!;
  }

  static TripType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TripType decode(dynamic value) {
    switch (value) {
      case 'taxiShare':
        return TripType.taxiShare;
      case 'lookingDriver':
        return TripType.lookingDriver;
      case 'lookingPassenger':
        return TripType.lookingPassenger;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TripType self) {
    switch (self) {
      case TripType.taxiShare:
        return 'taxiShare';
      case TripType.lookingDriver:
        return 'lookingDriver';
      case TripType.lookingPassenger:
        return 'lookingPassenger';
    }
  }
}

extension TripTypeMapperExtension on TripType {
  String toValue() {
    TripTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TripType>(this) as String;
  }
}

class TripMapper extends ClassMapperBase<Trip> {
  TripMapper._();

  static TripMapper? _instance;
  static TripMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TripMapper._());
      GeoapifyPlaceMapper.ensureInitialized();
      TripStatusMapper.ensureInitialized();
      TripTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Trip';

  static String? _$tripId(Trip v) => v.tripId;
  static const Field<Trip, String> _f$tripId = Field('tripId', _$tripId, key: 'trip_id', opt: true);
  static String? _$createdBy(Trip v) => v.createdBy;
  static const Field<Trip, String> _f$createdBy = Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static int? _$passengerLimit(Trip v) => v.passengerLimit;
  static const Field<Trip, int> _f$passengerLimit =
      Field('passengerLimit', _$passengerLimit, key: 'passenger_limit', opt: true);
  static List<String>? _$invites(Trip v) => v.invites;
  static const Field<Trip, List<String>> _f$invites = Field('invites', _$invites, opt: true);
  static List<String>? _$reviewIds(Trip v) => v.reviewIds;
  static const Field<Trip, List<String>> _f$reviewIds = Field('reviewIds', _$reviewIds, key: 'review_ids', opt: true);
  static String? _$departureTime(Trip v) => v.departureTime;
  static const Field<Trip, String> _f$departureTime = Field('departureTime', _$departureTime, opt: true);
  static String? _$createdAt(Trip v) => v.createdAt;
  static const Field<Trip, String> _f$createdAt = Field('createdAt', _$createdAt, key: 'created_at', opt: true);
  static GeoapifyPlace _$startDestination(Trip v) => v.startDestination;
  static const Field<Trip, GeoapifyPlace> _f$startDestination =
      Field('startDestination', _$startDestination, key: 'start_destination');
  static GeoapifyPlace _$finalDestination(Trip v) => v.finalDestination;
  static const Field<Trip, GeoapifyPlace> _f$finalDestination =
      Field('finalDestination', _$finalDestination, key: 'final_destination');
  static String? _$endAt(Trip v) => v.endAt;
  static const Field<Trip, String> _f$endAt = Field('endAt', _$endAt, key: 'end_at', opt: true);
  static TripStatus _$status(Trip v) => v.status;
  static const Field<Trip, TripStatus> _f$status = Field('status', _$status);
  static TripType _$type(Trip v) => v.type;
  static const Field<Trip, TripType> _f$type = Field('type', _$type);

  @override
  final MappableFields<Trip> fields = const {
    #tripId: _f$tripId,
    #createdBy: _f$createdBy,
    #passengerLimit: _f$passengerLimit,
    #invites: _f$invites,
    #reviewIds: _f$reviewIds,
    #departureTime: _f$departureTime,
    #createdAt: _f$createdAt,
    #startDestination: _f$startDestination,
    #finalDestination: _f$finalDestination,
    #endAt: _f$endAt,
    #status: _f$status,
    #type: _f$type,
  };

  static Trip _instantiate(DecodingData data) {
    return Trip(
        tripId: data.dec(_f$tripId),
        createdBy: data.dec(_f$createdBy),
        passengerLimit: data.dec(_f$passengerLimit),
        invites: data.dec(_f$invites),
        reviewIds: data.dec(_f$reviewIds),
        departureTime: data.dec(_f$departureTime),
        createdAt: data.dec(_f$createdAt),
        startDestination: data.dec(_f$startDestination),
        finalDestination: data.dec(_f$finalDestination),
        endAt: data.dec(_f$endAt),
        status: data.dec(_f$status),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static Trip fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Trip>(map);
  }

  static Trip fromJson(String json) {
    return ensureInitialized().decodeJson<Trip>(json);
  }
}

mixin TripMappable {
  String toJson() {
    return TripMapper.ensureInitialized().encodeJson<Trip>(this as Trip);
  }

  Map<String, dynamic> toMap() {
    return TripMapper.ensureInitialized().encodeMap<Trip>(this as Trip);
  }

  TripCopyWith<Trip, Trip, Trip> get copyWith => _TripCopyWithImpl(this as Trip, $identity, $identity);
  @override
  String toString() {
    return TripMapper.ensureInitialized().stringifyValue(this as Trip);
  }

  @override
  bool operator ==(Object other) {
    return TripMapper.ensureInitialized().equalsValue(this as Trip, other);
  }

  @override
  int get hashCode {
    return TripMapper.ensureInitialized().hashValue(this as Trip);
  }
}

extension TripValueCopy<$R, $Out> on ObjectCopyWith<$R, Trip, $Out> {
  TripCopyWith<$R, Trip, $Out> get $asTrip => $base.as((v, t, t2) => _TripCopyWithImpl(v, t, t2));
}

abstract class TripCopyWith<$R, $In extends Trip, $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get invites;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reviewIds;
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get startDestination;
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get finalDestination;
  $R call(
      {String? tripId,
      String? createdBy,
      int? passengerLimit,
      List<String>? invites,
      List<String>? reviewIds,
      String? departureTime,
      String? createdAt,
      GeoapifyPlace? startDestination,
      GeoapifyPlace? finalDestination,
      String? endAt,
      TripStatus? status,
      TripType? type});
  TripCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TripCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Trip, $Out> implements TripCopyWith<$R, Trip, $Out> {
  _TripCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Trip> $mapper = TripMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get invites => $value.invites != null
      ? ListCopyWith($value.invites!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(invites: v))
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get reviewIds => $value.reviewIds != null
      ? ListCopyWith($value.reviewIds!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(reviewIds: v))
      : null;
  @override
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get startDestination =>
      $value.startDestination.copyWith.$chain((v) => call(startDestination: v));
  @override
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace> get finalDestination =>
      $value.finalDestination.copyWith.$chain((v) => call(finalDestination: v));
  @override
  $R call(
          {Object? tripId = $none,
          Object? createdBy = $none,
          Object? passengerLimit = $none,
          Object? invites = $none,
          Object? reviewIds = $none,
          Object? departureTime = $none,
          Object? createdAt = $none,
          GeoapifyPlace? startDestination,
          GeoapifyPlace? finalDestination,
          Object? endAt = $none,
          TripStatus? status,
          TripType? type}) =>
      $apply(FieldCopyWithData({
        if (tripId != $none) #tripId: tripId,
        if (createdBy != $none) #createdBy: createdBy,
        if (passengerLimit != $none) #passengerLimit: passengerLimit,
        if (invites != $none) #invites: invites,
        if (reviewIds != $none) #reviewIds: reviewIds,
        if (departureTime != $none) #departureTime: departureTime,
        if (createdAt != $none) #createdAt: createdAt,
        if (startDestination != null) #startDestination: startDestination,
        if (finalDestination != null) #finalDestination: finalDestination,
        if (endAt != $none) #endAt: endAt,
        if (status != null) #status: status,
        if (type != null) #type: type
      }));
  @override
  Trip $make(CopyWithData data) => Trip(
      tripId: data.get(#tripId, or: $value.tripId),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      passengerLimit: data.get(#passengerLimit, or: $value.passengerLimit),
      invites: data.get(#invites, or: $value.invites),
      reviewIds: data.get(#reviewIds, or: $value.reviewIds),
      departureTime: data.get(#departureTime, or: $value.departureTime),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      startDestination: data.get(#startDestination, or: $value.startDestination),
      finalDestination: data.get(#finalDestination, or: $value.finalDestination),
      endAt: data.get(#endAt, or: $value.endAt),
      status: data.get(#status, or: $value.status),
      type: data.get(#type, or: $value.type));

  @override
  TripCopyWith<$R2, Trip, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _TripCopyWithImpl($value, $cast, t);
}
