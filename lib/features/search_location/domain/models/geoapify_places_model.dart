import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/search_location/domain/models/datasource_model.dart';
import 'package:unipool/features/search_location/domain/models/rank_model.dart';
import 'package:unipool/features/search_location/domain/models/timezone_model.dart';

part 'geoapify_places_model.mapper.dart';

@MappableClass()
class GeoapifyPlace with GeoapifyPlaceMappable {
  const GeoapifyPlace({
    @MappableField(key: 'country') this.country,
    @MappableField(key: 'city') this.city,
    @MappableField(key: 'postcode') this.postcode,
    @MappableField(key: 'street') this.street,
    @MappableField(key: 'district') this.district,
    @MappableField(key: 'name') this.name,
    @MappableField(key: 'state') this.state,
    @MappableField(key: 'datasource') this.datasource,
    @MappableField(key: 'country_code') this.countryCode,
    @MappableField(key: 'lon') this.lon,
    @MappableField(key: 'lat') this.lat,
    @MappableField(key: 'GeoapifyPlace_type') this.geoapifyPlaceType,
    @MappableField(key: 'formatted') this.formatted,
    @MappableField(key: 'address_line1') this.addressLine1,
    @MappableField(key: 'address_line2') this.addressLine2,
    @MappableField(key: 'category') this.category,
    @MappableField(key: 'timezone') this.timezone,
    @MappableField(key: 'plus_code') this.plusCode,
    @MappableField(key: 'plus_code_short') this.plusCodeShort,
    @MappableField(key: 'rank') this.rank,
    @MappableField(key: 'place_id') this.placeId,
  });

  final String? country;
  final String? city;
  final String? postcode;
  final String? street;
  final String? district;
  final String? name;
  final String? state;
  final Datasource? datasource;
  final String? countryCode;
  final double? lon;
  final double? lat;
  final String? geoapifyPlaceType;
  final String? formatted;
  final String? addressLine1;
  final String? addressLine2;
  final String? category;
  final Timezone? timezone;
  final String? plusCode;
  final String? plusCodeShort;
  final Rank? rank;
  final String? placeId;
}
