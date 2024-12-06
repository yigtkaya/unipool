// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'currency.dart';

class CurrencyMapper extends ClassMapperBase<Currency> {
  CurrencyMapper._();

  static CurrencyMapper? _instance;
  static CurrencyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CurrencyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Currency';

  static String _$code(Currency v) => v.code;
  static const Field<Currency, String> _f$code = Field('code', _$code);
  static String _$symbol(Currency v) => v.symbol;
  static const Field<Currency, String> _f$symbol = Field('symbol', _$symbol);
  static String _$name(Currency v) => v.name;
  static const Field<Currency, String> _f$name = Field('name', _$name);
  static String _$shortName(Currency v) => v.shortName;
  static const Field<Currency, String> _f$shortName = Field('shortName', _$shortName);

  @override
  final MappableFields<Currency> fields = const {
    #code: _f$code,
    #symbol: _f$symbol,
    #name: _f$name,
    #shortName: _f$shortName,
  };

  static Currency _instantiate(DecodingData data) {
    return Currency(
        code: data.dec(_f$code),
        symbol: data.dec(_f$symbol),
        name: data.dec(_f$name),
        shortName: data.dec(_f$shortName));
  }

  @override
  final Function instantiate = _instantiate;

  static Currency fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Currency>(map);
  }

  static Currency fromJson(String json) {
    return ensureInitialized().decodeJson<Currency>(json);
  }
}

mixin CurrencyMappable {
  String toJson() {
    return CurrencyMapper.ensureInitialized().encodeJson<Currency>(this as Currency);
  }

  Map<String, dynamic> toMap() {
    return CurrencyMapper.ensureInitialized().encodeMap<Currency>(this as Currency);
  }

  CurrencyCopyWith<Currency, Currency, Currency> get copyWith =>
      _CurrencyCopyWithImpl(this as Currency, $identity, $identity);
  @override
  String toString() {
    return CurrencyMapper.ensureInitialized().stringifyValue(this as Currency);
  }

  @override
  bool operator ==(Object other) {
    return CurrencyMapper.ensureInitialized().equalsValue(this as Currency, other);
  }

  @override
  int get hashCode {
    return CurrencyMapper.ensureInitialized().hashValue(this as Currency);
  }
}

extension CurrencyValueCopy<$R, $Out> on ObjectCopyWith<$R, Currency, $Out> {
  CurrencyCopyWith<$R, Currency, $Out> get $asCurrency => $base.as((v, t, t2) => _CurrencyCopyWithImpl(v, t, t2));
}

abstract class CurrencyCopyWith<$R, $In extends Currency, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? code, String? symbol, String? name, String? shortName});
  CurrencyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CurrencyCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Currency, $Out>
    implements CurrencyCopyWith<$R, Currency, $Out> {
  _CurrencyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Currency> $mapper = CurrencyMapper.ensureInitialized();
  @override
  $R call({String? code, String? symbol, String? name, String? shortName}) => $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (symbol != null) #symbol: symbol,
        if (name != null) #name: name,
        if (shortName != null) #shortName: shortName
      }));
  @override
  Currency $make(CopyWithData data) => Currency(
      code: data.get(#code, or: $value.code),
      symbol: data.get(#symbol, or: $value.symbol),
      name: data.get(#name, or: $value.name),
      shortName: data.get(#shortName, or: $value.shortName));

  @override
  CurrencyCopyWith<$R2, Currency, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CurrencyCopyWithImpl($value, $cast, t);
}
