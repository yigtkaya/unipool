import 'package:dart_mappable/dart_mappable.dart';

part 'timezone_model.mapper.dart';

@MappableClass()
class Timezone with TimezoneMappable {
  const Timezone({
    @MappableField(key: 'name') this.name,
    @MappableField(key: 'offset_STD') this.offsetStd,
    @MappableField(key: 'offset_STD_seconds') this.offsetStdSeconds,
    @MappableField(key: 'offset_DST') this.offsetDst,
    @MappableField(key: 'offset_DST_seconds') this.offsetDstSeconds,
  });

  final String? name;
  final String? offsetStd;
  final int? offsetStdSeconds;
  final String? offsetDst;
  final int? offsetDstSeconds;
}
