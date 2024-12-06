// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timezone_model.dart';

class TimezoneMapper extends ClassMapperBase<Timezone> {
  TimezoneMapper._();

  static TimezoneMapper? _instance;
  static TimezoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimezoneMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Timezone';

  static String? _$name(Timezone v) => v.name;
  static const Field<Timezone, String> _f$name = Field('name', _$name, opt: true);
  static String? _$offsetStd(Timezone v) => v.offsetStd;
  static const Field<Timezone, String> _f$offsetStd = Field('offsetStd', _$offsetStd, key: 'offset_STD', opt: true);
  static int? _$offsetStdSeconds(Timezone v) => v.offsetStdSeconds;
  static const Field<Timezone, int> _f$offsetStdSeconds =
      Field('offsetStdSeconds', _$offsetStdSeconds, key: 'offset_STD_seconds', opt: true);
  static String? _$offsetDst(Timezone v) => v.offsetDst;
  static const Field<Timezone, String> _f$offsetDst = Field('offsetDst', _$offsetDst, key: 'offset_DST', opt: true);
  static int? _$offsetDstSeconds(Timezone v) => v.offsetDstSeconds;
  static const Field<Timezone, int> _f$offsetDstSeconds =
      Field('offsetDstSeconds', _$offsetDstSeconds, key: 'offset_DST_seconds', opt: true);

  @override
  final MappableFields<Timezone> fields = const {
    #name: _f$name,
    #offsetStd: _f$offsetStd,
    #offsetStdSeconds: _f$offsetStdSeconds,
    #offsetDst: _f$offsetDst,
    #offsetDstSeconds: _f$offsetDstSeconds,
  };

  static Timezone _instantiate(DecodingData data) {
    return Timezone(
        name: data.dec(_f$name),
        offsetStd: data.dec(_f$offsetStd),
        offsetStdSeconds: data.dec(_f$offsetStdSeconds),
        offsetDst: data.dec(_f$offsetDst),
        offsetDstSeconds: data.dec(_f$offsetDstSeconds));
  }

  @override
  final Function instantiate = _instantiate;

  static Timezone fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Timezone>(map);
  }

  static Timezone fromJson(String json) {
    return ensureInitialized().decodeJson<Timezone>(json);
  }
}

mixin TimezoneMappable {
  String toJson() {
    return TimezoneMapper.ensureInitialized().encodeJson<Timezone>(this as Timezone);
  }

  Map<String, dynamic> toMap() {
    return TimezoneMapper.ensureInitialized().encodeMap<Timezone>(this as Timezone);
  }

  TimezoneCopyWith<Timezone, Timezone, Timezone> get copyWith =>
      _TimezoneCopyWithImpl(this as Timezone, $identity, $identity);
  @override
  String toString() {
    return TimezoneMapper.ensureInitialized().stringifyValue(this as Timezone);
  }

  @override
  bool operator ==(Object other) {
    return TimezoneMapper.ensureInitialized().equalsValue(this as Timezone, other);
  }

  @override
  int get hashCode {
    return TimezoneMapper.ensureInitialized().hashValue(this as Timezone);
  }
}

extension TimezoneValueCopy<$R, $Out> on ObjectCopyWith<$R, Timezone, $Out> {
  TimezoneCopyWith<$R, Timezone, $Out> get $asTimezone => $base.as((v, t, t2) => _TimezoneCopyWithImpl(v, t, t2));
}

abstract class TimezoneCopyWith<$R, $In extends Timezone, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? offsetStd, int? offsetStdSeconds, String? offsetDst, int? offsetDstSeconds});
  TimezoneCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimezoneCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Timezone, $Out>
    implements TimezoneCopyWith<$R, Timezone, $Out> {
  _TimezoneCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Timezone> $mapper = TimezoneMapper.ensureInitialized();
  @override
  $R call(
          {Object? name = $none,
          Object? offsetStd = $none,
          Object? offsetStdSeconds = $none,
          Object? offsetDst = $none,
          Object? offsetDstSeconds = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (offsetStd != $none) #offsetStd: offsetStd,
        if (offsetStdSeconds != $none) #offsetStdSeconds: offsetStdSeconds,
        if (offsetDst != $none) #offsetDst: offsetDst,
        if (offsetDstSeconds != $none) #offsetDstSeconds: offsetDstSeconds
      }));
  @override
  Timezone $make(CopyWithData data) => Timezone(
      name: data.get(#name, or: $value.name),
      offsetStd: data.get(#offsetStd, or: $value.offsetStd),
      offsetStdSeconds: data.get(#offsetStdSeconds, or: $value.offsetStdSeconds),
      offsetDst: data.get(#offsetDst, or: $value.offsetDst),
      offsetDstSeconds: data.get(#offsetDstSeconds, or: $value.offsetDstSeconds));

  @override
  TimezoneCopyWith<$R2, Timezone, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TimezoneCopyWithImpl($value, $cast, t);
}
