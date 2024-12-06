import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

part 'datasource_model.mapper.dart';

@MappableClass()
class Datasource with DatasourceMappable {
  const Datasource({
    @MappableField(key: 'sourcename') this.sourcename,
    @MappableField(key: 'attribution') this.attribution,
    @MappableField(key: 'license') this.license,
    @MappableField(key: 'url') this.url,
  });

  final String? sourcename;
  final String? attribution;
  final String? license;
  final String? url;
}

@MappableClass()
class GeoapifyResponseModel with GeoapifyResponseModelMappable {
  const GeoapifyResponseModel({
    @MappableField(key: 'results') this.results,
  });

  final List<GeoapifyPlace>? results;
}
