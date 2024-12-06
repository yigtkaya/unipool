import 'package:dart_mappable/dart_mappable.dart';

part 'currency.mapper.dart';

@MappableClass(discriminatorKey: "code")
class Currency with CurrencyMappable {
  const Currency({
    required this.code,
    required this.symbol,
    required this.name,
    required this.shortName,
  });

  final String code;
  final String symbol;
  final String name;
  final String shortName;
}
