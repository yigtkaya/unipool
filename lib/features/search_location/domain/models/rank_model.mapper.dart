// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rank_model.dart';

class RankMapper extends ClassMapperBase<Rank> {
  RankMapper._();

  static RankMapper? _instance;
  static RankMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RankMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Rank';

  static int? _$confidence(Rank v) => v.confidence;
  static const Field<Rank, int> _f$confidence = Field('confidence', _$confidence, opt: true);
  static int? _$confidenceStreetLevel(Rank v) => v.confidenceStreetLevel;
  static const Field<Rank, int> _f$confidenceStreetLevel =
      Field('confidenceStreetLevel', _$confidenceStreetLevel, key: 'confidence_street_level', opt: true);
  static String? _$matchType(Rank v) => v.matchType;
  static const Field<Rank, String> _f$matchType = Field('matchType', _$matchType, key: 'match_type', opt: true);

  @override
  final MappableFields<Rank> fields = const {
    #confidence: _f$confidence,
    #confidenceStreetLevel: _f$confidenceStreetLevel,
    #matchType: _f$matchType,
  };

  static Rank _instantiate(DecodingData data) {
    return Rank(
        confidence: data.dec(_f$confidence),
        confidenceStreetLevel: data.dec(_f$confidenceStreetLevel),
        matchType: data.dec(_f$matchType));
  }

  @override
  final Function instantiate = _instantiate;

  static Rank fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Rank>(map);
  }

  static Rank fromJson(String json) {
    return ensureInitialized().decodeJson<Rank>(json);
  }
}

mixin RankMappable {
  String toJson() {
    return RankMapper.ensureInitialized().encodeJson<Rank>(this as Rank);
  }

  Map<String, dynamic> toMap() {
    return RankMapper.ensureInitialized().encodeMap<Rank>(this as Rank);
  }

  RankCopyWith<Rank, Rank, Rank> get copyWith => _RankCopyWithImpl(this as Rank, $identity, $identity);
  @override
  String toString() {
    return RankMapper.ensureInitialized().stringifyValue(this as Rank);
  }

  @override
  bool operator ==(Object other) {
    return RankMapper.ensureInitialized().equalsValue(this as Rank, other);
  }

  @override
  int get hashCode {
    return RankMapper.ensureInitialized().hashValue(this as Rank);
  }
}

extension RankValueCopy<$R, $Out> on ObjectCopyWith<$R, Rank, $Out> {
  RankCopyWith<$R, Rank, $Out> get $asRank => $base.as((v, t, t2) => _RankCopyWithImpl(v, t, t2));
}

abstract class RankCopyWith<$R, $In extends Rank, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? confidence, int? confidenceStreetLevel, String? matchType});
  RankCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RankCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Rank, $Out> implements RankCopyWith<$R, Rank, $Out> {
  _RankCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Rank> $mapper = RankMapper.ensureInitialized();
  @override
  $R call({Object? confidence = $none, Object? confidenceStreetLevel = $none, Object? matchType = $none}) =>
      $apply(FieldCopyWithData({
        if (confidence != $none) #confidence: confidence,
        if (confidenceStreetLevel != $none) #confidenceStreetLevel: confidenceStreetLevel,
        if (matchType != $none) #matchType: matchType
      }));
  @override
  Rank $make(CopyWithData data) => Rank(
      confidence: data.get(#confidence, or: $value.confidence),
      confidenceStreetLevel: data.get(#confidenceStreetLevel, or: $value.confidenceStreetLevel),
      matchType: data.get(#matchType, or: $value.matchType));

  @override
  RankCopyWith<$R2, Rank, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _RankCopyWithImpl($value, $cast, t);
}
