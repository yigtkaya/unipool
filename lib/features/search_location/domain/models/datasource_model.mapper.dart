// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'datasource_model.dart';

class DatasourceMapper extends ClassMapperBase<Datasource> {
  DatasourceMapper._();

  static DatasourceMapper? _instance;
  static DatasourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DatasourceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Datasource';

  static String? _$sourcename(Datasource v) => v.sourcename;
  static const Field<Datasource, String> _f$sourcename = Field('sourcename', _$sourcename, opt: true);
  static String? _$attribution(Datasource v) => v.attribution;
  static const Field<Datasource, String> _f$attribution = Field('attribution', _$attribution, opt: true);
  static String? _$license(Datasource v) => v.license;
  static const Field<Datasource, String> _f$license = Field('license', _$license, opt: true);
  static String? _$url(Datasource v) => v.url;
  static const Field<Datasource, String> _f$url = Field('url', _$url, opt: true);

  @override
  final MappableFields<Datasource> fields = const {
    #sourcename: _f$sourcename,
    #attribution: _f$attribution,
    #license: _f$license,
    #url: _f$url,
  };

  static Datasource _instantiate(DecodingData data) {
    return Datasource(
        sourcename: data.dec(_f$sourcename),
        attribution: data.dec(_f$attribution),
        license: data.dec(_f$license),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static Datasource fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Datasource>(map);
  }

  static Datasource fromJson(String json) {
    return ensureInitialized().decodeJson<Datasource>(json);
  }
}

mixin DatasourceMappable {
  String toJson() {
    return DatasourceMapper.ensureInitialized().encodeJson<Datasource>(this as Datasource);
  }

  Map<String, dynamic> toMap() {
    return DatasourceMapper.ensureInitialized().encodeMap<Datasource>(this as Datasource);
  }

  DatasourceCopyWith<Datasource, Datasource, Datasource> get copyWith =>
      _DatasourceCopyWithImpl(this as Datasource, $identity, $identity);
  @override
  String toString() {
    return DatasourceMapper.ensureInitialized().stringifyValue(this as Datasource);
  }

  @override
  bool operator ==(Object other) {
    return DatasourceMapper.ensureInitialized().equalsValue(this as Datasource, other);
  }

  @override
  int get hashCode {
    return DatasourceMapper.ensureInitialized().hashValue(this as Datasource);
  }
}

extension DatasourceValueCopy<$R, $Out> on ObjectCopyWith<$R, Datasource, $Out> {
  DatasourceCopyWith<$R, Datasource, $Out> get $asDatasource =>
      $base.as((v, t, t2) => _DatasourceCopyWithImpl(v, t, t2));
}

abstract class DatasourceCopyWith<$R, $In extends Datasource, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? sourcename, String? attribution, String? license, String? url});
  DatasourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DatasourceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Datasource, $Out>
    implements DatasourceCopyWith<$R, Datasource, $Out> {
  _DatasourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Datasource> $mapper = DatasourceMapper.ensureInitialized();
  @override
  $R call({Object? sourcename = $none, Object? attribution = $none, Object? license = $none, Object? url = $none}) =>
      $apply(FieldCopyWithData({
        if (sourcename != $none) #sourcename: sourcename,
        if (attribution != $none) #attribution: attribution,
        if (license != $none) #license: license,
        if (url != $none) #url: url
      }));
  @override
  Datasource $make(CopyWithData data) => Datasource(
      sourcename: data.get(#sourcename, or: $value.sourcename),
      attribution: data.get(#attribution, or: $value.attribution),
      license: data.get(#license, or: $value.license),
      url: data.get(#url, or: $value.url));

  @override
  DatasourceCopyWith<$R2, Datasource, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DatasourceCopyWithImpl($value, $cast, t);
}

class GeoapifyResponseModelMapper extends ClassMapperBase<GeoapifyResponseModel> {
  GeoapifyResponseModelMapper._();

  static GeoapifyResponseModelMapper? _instance;
  static GeoapifyResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GeoapifyResponseModelMapper._());
      GeoapifyPlaceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GeoapifyResponseModel';

  static List<GeoapifyPlace>? _$results(GeoapifyResponseModel v) => v.results;
  static const Field<GeoapifyResponseModel, List<GeoapifyPlace>> _f$results = Field('results', _$results, opt: true);

  @override
  final MappableFields<GeoapifyResponseModel> fields = const {
    #results: _f$results,
  };

  static GeoapifyResponseModel _instantiate(DecodingData data) {
    return GeoapifyResponseModel(results: data.dec(_f$results));
  }

  @override
  final Function instantiate = _instantiate;

  static GeoapifyResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GeoapifyResponseModel>(map);
  }

  static GeoapifyResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<GeoapifyResponseModel>(json);
  }
}

mixin GeoapifyResponseModelMappable {
  String toJson() {
    return GeoapifyResponseModelMapper.ensureInitialized()
        .encodeJson<GeoapifyResponseModel>(this as GeoapifyResponseModel);
  }

  Map<String, dynamic> toMap() {
    return GeoapifyResponseModelMapper.ensureInitialized()
        .encodeMap<GeoapifyResponseModel>(this as GeoapifyResponseModel);
  }

  GeoapifyResponseModelCopyWith<GeoapifyResponseModel, GeoapifyResponseModel, GeoapifyResponseModel> get copyWith =>
      _GeoapifyResponseModelCopyWithImpl(this as GeoapifyResponseModel, $identity, $identity);
  @override
  String toString() {
    return GeoapifyResponseModelMapper.ensureInitialized().stringifyValue(this as GeoapifyResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return GeoapifyResponseModelMapper.ensureInitialized().equalsValue(this as GeoapifyResponseModel, other);
  }

  @override
  int get hashCode {
    return GeoapifyResponseModelMapper.ensureInitialized().hashValue(this as GeoapifyResponseModel);
  }
}

extension GeoapifyResponseModelValueCopy<$R, $Out> on ObjectCopyWith<$R, GeoapifyResponseModel, $Out> {
  GeoapifyResponseModelCopyWith<$R, GeoapifyResponseModel, $Out> get $asGeoapifyResponseModel =>
      $base.as((v, t, t2) => _GeoapifyResponseModelCopyWithImpl(v, t, t2));
}

abstract class GeoapifyResponseModelCopyWith<$R, $In extends GeoapifyResponseModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GeoapifyPlace, GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace>>? get results;
  $R call({List<GeoapifyPlace>? results});
  GeoapifyResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GeoapifyResponseModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, GeoapifyResponseModel, $Out>
    implements GeoapifyResponseModelCopyWith<$R, GeoapifyResponseModel, $Out> {
  _GeoapifyResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GeoapifyResponseModel> $mapper = GeoapifyResponseModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GeoapifyPlace, GeoapifyPlaceCopyWith<$R, GeoapifyPlace, GeoapifyPlace>>? get results =>
      $value.results != null
          ? ListCopyWith($value.results!, (v, t) => v.copyWith.$chain(t), (v) => call(results: v))
          : null;
  @override
  $R call({Object? results = $none}) => $apply(FieldCopyWithData({if (results != $none) #results: results}));
  @override
  GeoapifyResponseModel $make(CopyWithData data) =>
      GeoapifyResponseModel(results: data.get(#results, or: $value.results));

  @override
  GeoapifyResponseModelCopyWith<$R2, GeoapifyResponseModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GeoapifyResponseModelCopyWithImpl($value, $cast, t);
}
