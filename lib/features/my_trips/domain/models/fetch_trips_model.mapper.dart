// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fetch_trips_model.dart';

class TripsResponseModelMapper extends ClassMapperBase<TripsResponseModel> {
  TripsResponseModelMapper._();

  static TripsResponseModelMapper? _instance;
  static TripsResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TripsResponseModelMapper._());
      TripMapper.ensureInitialized();
      ProfileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TripsResponseModel';

  static Trip _$trip(TripsResponseModel v) => v.trip;
  static const Field<TripsResponseModel, Trip> _f$trip = Field('trip', _$trip, key: 'ride');
  static ProfileModel _$ownerProfile(TripsResponseModel v) => v.ownerProfile;
  static const Field<TripsResponseModel, ProfileModel> _f$ownerProfile =
      Field('ownerProfile', _$ownerProfile, key: 'created_by_profile');
  static List<dynamic> _$passengers(TripsResponseModel v) => v.passengers;
  static const Field<TripsResponseModel, List<dynamic>> _f$passengers = Field('passengers', _$passengers);

  @override
  final MappableFields<TripsResponseModel> fields = const {
    #trip: _f$trip,
    #ownerProfile: _f$ownerProfile,
    #passengers: _f$passengers,
  };

  static TripsResponseModel _instantiate(DecodingData data) {
    return TripsResponseModel(
        trip: data.dec(_f$trip), ownerProfile: data.dec(_f$ownerProfile), passengers: data.dec(_f$passengers));
  }

  @override
  final Function instantiate = _instantiate;

  static TripsResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TripsResponseModel>(map);
  }

  static TripsResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<TripsResponseModel>(json);
  }
}

mixin TripsResponseModelMappable {
  String toJson() {
    return TripsResponseModelMapper.ensureInitialized().encodeJson<TripsResponseModel>(this as TripsResponseModel);
  }

  Map<String, dynamic> toMap() {
    return TripsResponseModelMapper.ensureInitialized().encodeMap<TripsResponseModel>(this as TripsResponseModel);
  }

  TripsResponseModelCopyWith<TripsResponseModel, TripsResponseModel, TripsResponseModel> get copyWith =>
      _TripsResponseModelCopyWithImpl(this as TripsResponseModel, $identity, $identity);
  @override
  String toString() {
    return TripsResponseModelMapper.ensureInitialized().stringifyValue(this as TripsResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return TripsResponseModelMapper.ensureInitialized().equalsValue(this as TripsResponseModel, other);
  }

  @override
  int get hashCode {
    return TripsResponseModelMapper.ensureInitialized().hashValue(this as TripsResponseModel);
  }
}

extension TripsResponseModelValueCopy<$R, $Out> on ObjectCopyWith<$R, TripsResponseModel, $Out> {
  TripsResponseModelCopyWith<$R, TripsResponseModel, $Out> get $asTripsResponseModel =>
      $base.as((v, t, t2) => _TripsResponseModelCopyWithImpl(v, t, t2));
}

abstract class TripsResponseModelCopyWith<$R, $In extends TripsResponseModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TripCopyWith<$R, Trip, Trip> get trip;
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel> get ownerProfile;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get passengers;
  $R call({Trip? trip, ProfileModel? ownerProfile, List<dynamic>? passengers});
  TripsResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TripsResponseModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, TripsResponseModel, $Out>
    implements TripsResponseModelCopyWith<$R, TripsResponseModel, $Out> {
  _TripsResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TripsResponseModel> $mapper = TripsResponseModelMapper.ensureInitialized();
  @override
  TripCopyWith<$R, Trip, Trip> get trip => $value.trip.copyWith.$chain((v) => call(trip: v));
  @override
  ProfileModelCopyWith<$R, ProfileModel, ProfileModel> get ownerProfile =>
      $value.ownerProfile.copyWith.$chain((v) => call(ownerProfile: v));
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get passengers =>
      ListCopyWith($value.passengers, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(passengers: v));
  @override
  $R call({Trip? trip, ProfileModel? ownerProfile, List<dynamic>? passengers}) => $apply(FieldCopyWithData({
        if (trip != null) #trip: trip,
        if (ownerProfile != null) #ownerProfile: ownerProfile,
        if (passengers != null) #passengers: passengers
      }));
  @override
  TripsResponseModel $make(CopyWithData data) => TripsResponseModel(
      trip: data.get(#trip, or: $value.trip),
      ownerProfile: data.get(#ownerProfile, or: $value.ownerProfile),
      passengers: data.get(#passengers, or: $value.passengers));

  @override
  TripsResponseModelCopyWith<$R2, TripsResponseModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TripsResponseModelCopyWithImpl($value, $cast, t);
}
