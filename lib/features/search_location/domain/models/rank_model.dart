import 'package:dart_mappable/dart_mappable.dart';

part 'rank_model.mapper.dart';

@MappableClass()
class Rank with RankMappable {
  const Rank({
    @MappableField(key: 'confidence') this.confidence,
    @MappableField(key: 'confidence_street_level') this.confidenceStreetLevel,
    @MappableField(key: 'match_type') this.matchType,
  });

  final int? confidence;
  final int? confidenceStreetLevel;
  final String? matchType;
}
