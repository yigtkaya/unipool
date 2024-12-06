// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'geoapify_places_model.dart';

class GeoapifyPlaceMapper extends ClassMapperBase<GeoapifyPlace> {
  GeoapifyPlaceMapper._();

  static GeoapifyPlaceMapper? _instance;
  static GeoapifyPlaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GeoapifyPlaceMapper._());
      DatasourceMapper.ensureInitialized();
      TimezoneMapper.ensureInitialized();
      RankMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GeoapifyPlace';

  static String? _$country(GeoapifyPlace v) => v.country;
  static const Field<GeoapifyPlace, String> _f$country = Field('country', _$country, opt: true);
  static String? _$city(GeoapifyPlace v) => v.city;
  static const Field<GeoapifyPlace, String> _f$city = Field('city', _$city, opt: true);
  static String? _$postcode(GeoapifyPlace v) => v.postcode;
  static const Field<GeoapifyPlace, String> _f$postcode = Field('postcode', _$postcode, opt: true);
  static String? _$street(GeoapifyPlace v) => v.street;
  static const Field<GeoapifyPlace, String> _f$street = Field('street', _$street, opt: true);
  static String? _$district(GeoapifyPlace v) => v.district;
  static const Field<GeoapifyPlace, String> _f$district = Field('district', _$district, opt: true);
  static String? _$name(GeoapifyPlace v) => v.name;
  static const Field<GeoapifyPlace, String> _f$name = Field('name', _$name, opt: true);
  static String? _$state(GeoapifyPlace v) => v.state;
  static const Field<GeoapifyPlace, String> _f$state = Field('state', _$state, opt: true);
  static Datasource? _$datasource(GeoapifyPlace v) => v.datasource;
  static const Field<GeoapifyPlace, Datasource> _f$datasource = Field('datasource', _$datasource, opt: true);
  static String? _$countryCode(GeoapifyPlace v) => v.countryCode;
  static const Field<GeoapifyPlace, String> _f$countryCode =
      Field('countryCode', _$countryCode, key: 'country_code', opt: true);
  static double? _$lon(GeoapifyPlace v) => v.lon;
  static const Field<GeoapifyPlace, double> _f$lon = Field('lon', _$lon, opt: true);
  static double? _$lat(GeoapifyPlace v) => v.lat;
  static const Field<GeoapifyPlace, double> _f$lat = Field('lat', _$lat, opt: true);
  static String? _$geoapifyPlaceType(GeoapifyPlace v) => v.geoapifyPlaceType;
  static const Field<GeoapifyPlace, String> _f$geoapifyPlaceType =
      Field('geoapifyPlaceType', _$geoapifyPlaceType, key: 'GeoapifyPlace_type', opt: true);
  static String? _$formatted(GeoapifyPlace v) => v.formatted;
  static const Field<GeoapifyPlace, String> _f$formatted = Field('formatted', _$formatted, opt: true);
  static String? _$addressLine1(GeoapifyPlace v) => v.addressLine1;
  static const Field<GeoapifyPlace, String> _f$addressLine1 =
      Field('addressLine1', _$addressLine1, key: 'address_line1', opt: true);
  static String? _$addressLine2(GeoapifyPlace v) => v.addressLine2;
  static const Field<GeoapifyPlace, String> _f$addressLine2 =
      Field('addressLine2', _$addressLine2, key: 'address_line2', opt: true);
  static String? _$category(GeoapifyPlace v) => v.category;
  static const Field<GeoapifyPlace, String> _f$category = Field('category', _$category, opt: true);
  static Timezone? _$timezone(GeoapifyPlace v) => v.timezone;
  static const Field<GeoapifyPlace, Timezone> _f$timezone = Field('timezone', _$timezone, opt: true);
  static String? _$plusCode(GeoapifyPlace v) => v.plusCode;
  static const Field<GeoapifyPlace, String> _f$plusCode = Field('plusCode', _$plusCode, key: 'plus_code', opt: true);
  static String? _$plusCodeShort(GeoapifyPlace v) => v.plusCodeShort;
  static const Field<GeoapifyPlace, String> _f$plusCodeShort =
      Field('plusCodeShort', _$plusCodeShort, key: 'plus_code_short', opt: true);
  static Rank? _$rank(GeoapifyPlace v) => v.rank;
  static const Field<GeoapifyPlace, Rank> _f$rank = Field('rank', _$rank, opt: true);
  static String? _$placeId(GeoapifyPlace v) => v.placeId;
  static const Field<GeoapifyPlace, String> _f$placeId = Field('placeId', _$placeId, key: 'place_id', opt: true);

  @override
  final MappableFields<GeoapifyPlace> fields = const {
    #country: _f$country,
    #city: _f$city,
    #postcode: _f$postcode,
    #street: _f$street,
    #district: _f$district,
    #name: _f$name,
    #state: _f$state,
    #datasource: _f$datasource,
    #countryCode: _f$countryCode,
    #lon: _f$lon,
    #lat: _f$lat,
    #geoapifyPlaceType: _f$geoapifyPlaceType,
    #formatted: _f$formatted,
    #addressLine1: _f$addressLine1,
    #addressLine2: _f$addressLine2,
    #category: _f$category,
    #timezone: _f$timezone,
    #plusCode: _f$plusCode,
    #plusCodeShort: _f$plusCodeShort,
    #rank: _f$rank,
    #placeId: _f$placeId,
  };

  static GeoapifyPlace _instantiate(DecodingData data) {
    return GeoapifyPlace(
        country: data.dec(_f$country),
        city: data.dec(_f$city),
        postcode: data.dec(_f$postcode),
        street: data.dec(_f$street),
        district: data.dec(_f$district),
        name: data.dec(_f$name),
        state: data.dec(_f$state),
        datasource: data.dec(_f$datasource),
        countryCode: data.dec(_f$countryCode),
        lon: data.dec(_f$lon),
        lat: data.dec(_f$lat),
        geoapifyPlaceType: data.dec(_f$geoapifyPlaceType),
        formatted: data.dec(_f$formatted),
        addressLine1: data.dec(_f$addressLine1),
        addressLine2: data.dec(_f$addressLine2),
        category: data.dec(_f$category),
        timezone: data.dec(_f$timezone),
        plusCode: data.dec(_f$plusCode),
        plusCodeShort: data.dec(_f$plusCodeShort),
        rank: data.dec(_f$rank),
        placeId: data.dec(_f$placeId));
  }

  @override
  final Function instantiate = _instantiate;

  static GeoapifyPlace fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GeoapifyPlace>(map);
  }

  static GeoapifyPlace fromJson(String json) {
    return ensureInitialized().decodeJson<GeoapifyPlace>(json);
  }
}

mixin GeoapifyPlaceMappable {
  String toJson() {
    return GeoapifyPlaceMapper.ensureInitialized().encodeJson<GeoapifyPlace>(this as GeoapifyPlace);
  }

  Map<String, dynamic> toMap() {
    return GeoapifyPlaceMapper.ensureInitialized().encodeMap<GeoapifyPlace>(this as GeoapifyPlace);
  }

  GeoapifyPlaceCopyWith<GeoapifyPlace, GeoapifyPlace, GeoapifyPlace> get copyWith =>
      _GeoapifyPlaceCopyWithImpl(this as GeoapifyPlace, $identity, $identity);
  @override
  String toString() {
    return GeoapifyPlaceMapper.ensureInitialized().stringifyValue(this as GeoapifyPlace);
  }

  @override
  bool operator ==(Object other) {
    return GeoapifyPlaceMapper.ensureInitialized().equalsValue(this as GeoapifyPlace, other);
  }

  @override
  int get hashCode {
    return GeoapifyPlaceMapper.ensureInitialized().hashValue(this as GeoapifyPlace);
  }
}

extension GeoapifyPlaceValueCopy<$R, $Out> on ObjectCopyWith<$R, GeoapifyPlace, $Out> {
  GeoapifyPlaceCopyWith<$R, GeoapifyPlace, $Out> get $asGeoapifyPlace =>
      $base.as((v, t, t2) => _GeoapifyPlaceCopyWithImpl(v, t, t2));
}

abstract class GeoapifyPlaceCopyWith<$R, $In extends GeoapifyPlace, $Out> implements ClassCopyWith<$R, $In, $Out> {
  DatasourceCopyWith<$R, Datasource, Datasource>? get datasource;
  TimezoneCopyWith<$R, Timezone, Timezone>? get timezone;
  RankCopyWith<$R, Rank, Rank>? get rank;
  $R call(
      {String? country,
      String? city,
      String? postcode,
      String? street,
      String? district,
      String? name,
      String? state,
      Datasource? datasource,
      String? countryCode,
      double? lon,
      double? lat,
      String? geoapifyPlaceType,
      String? formatted,
      String? addressLine1,
      String? addressLine2,
      String? category,
      Timezone? timezone,
      String? plusCode,
      String? plusCodeShort,
      Rank? rank,
      String? placeId});
  GeoapifyPlaceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GeoapifyPlaceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, GeoapifyPlace, $Out>
    implements GeoapifyPlaceCopyWith<$R, GeoapifyPlace, $Out> {
  _GeoapifyPlaceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GeoapifyPlace> $mapper = GeoapifyPlaceMapper.ensureInitialized();
  @override
  DatasourceCopyWith<$R, Datasource, Datasource>? get datasource =>
      $value.datasource?.copyWith.$chain((v) => call(datasource: v));
  @override
  TimezoneCopyWith<$R, Timezone, Timezone>? get timezone => $value.timezone?.copyWith.$chain((v) => call(timezone: v));
  @override
  RankCopyWith<$R, Rank, Rank>? get rank => $value.rank?.copyWith.$chain((v) => call(rank: v));
  @override
  $R call(
          {Object? country = $none,
          Object? city = $none,
          Object? postcode = $none,
          Object? street = $none,
          Object? district = $none,
          Object? name = $none,
          Object? state = $none,
          Object? datasource = $none,
          Object? countryCode = $none,
          Object? lon = $none,
          Object? lat = $none,
          Object? geoapifyPlaceType = $none,
          Object? formatted = $none,
          Object? addressLine1 = $none,
          Object? addressLine2 = $none,
          Object? category = $none,
          Object? timezone = $none,
          Object? plusCode = $none,
          Object? plusCodeShort = $none,
          Object? rank = $none,
          Object? placeId = $none}) =>
      $apply(FieldCopyWithData({
        if (country != $none) #country: country,
        if (city != $none) #city: city,
        if (postcode != $none) #postcode: postcode,
        if (street != $none) #street: street,
        if (district != $none) #district: district,
        if (name != $none) #name: name,
        if (state != $none) #state: state,
        if (datasource != $none) #datasource: datasource,
        if (countryCode != $none) #countryCode: countryCode,
        if (lon != $none) #lon: lon,
        if (lat != $none) #lat: lat,
        if (geoapifyPlaceType != $none) #geoapifyPlaceType: geoapifyPlaceType,
        if (formatted != $none) #formatted: formatted,
        if (addressLine1 != $none) #addressLine1: addressLine1,
        if (addressLine2 != $none) #addressLine2: addressLine2,
        if (category != $none) #category: category,
        if (timezone != $none) #timezone: timezone,
        if (plusCode != $none) #plusCode: plusCode,
        if (plusCodeShort != $none) #plusCodeShort: plusCodeShort,
        if (rank != $none) #rank: rank,
        if (placeId != $none) #placeId: placeId
      }));
  @override
  GeoapifyPlace $make(CopyWithData data) => GeoapifyPlace(
      country: data.get(#country, or: $value.country),
      city: data.get(#city, or: $value.city),
      postcode: data.get(#postcode, or: $value.postcode),
      street: data.get(#street, or: $value.street),
      district: data.get(#district, or: $value.district),
      name: data.get(#name, or: $value.name),
      state: data.get(#state, or: $value.state),
      datasource: data.get(#datasource, or: $value.datasource),
      countryCode: data.get(#countryCode, or: $value.countryCode),
      lon: data.get(#lon, or: $value.lon),
      lat: data.get(#lat, or: $value.lat),
      geoapifyPlaceType: data.get(#geoapifyPlaceType, or: $value.geoapifyPlaceType),
      formatted: data.get(#formatted, or: $value.formatted),
      addressLine1: data.get(#addressLine1, or: $value.addressLine1),
      addressLine2: data.get(#addressLine2, or: $value.addressLine2),
      category: data.get(#category, or: $value.category),
      timezone: data.get(#timezone, or: $value.timezone),
      plusCode: data.get(#plusCode, or: $value.plusCode),
      plusCodeShort: data.get(#plusCodeShort, or: $value.plusCodeShort),
      rank: data.get(#rank, or: $value.rank),
      placeId: data.get(#placeId, or: $value.placeId));

  @override
  GeoapifyPlaceCopyWith<$R2, GeoapifyPlace, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GeoapifyPlaceCopyWithImpl($value, $cast, t);
}
