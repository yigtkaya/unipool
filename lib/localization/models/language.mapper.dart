// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'language.dart';

class LanguageMapper extends ClassMapperBase<Language> {
  LanguageMapper._();

  static LanguageMapper? _instance;
  static LanguageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LanguageMapper._());
      CurrencyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Language';

  static int _$id(Language v) => v.id;
  static const Field<Language, int> _f$id = Field('id', _$id);
  static String _$name(Language v) => v.name;
  static const Field<Language, String> _f$name = Field('name', _$name);
  static String _$imagePath(Language v) => v.imagePath;
  static const Field<Language, String> _f$imagePath = Field('imagePath', _$imagePath);
  static String _$urlCode(Language v) => v.urlCode;
  static const Field<Language, String> _f$urlCode = Field('urlCode', _$urlCode);
  static Locale _$locale(Language v) => v.locale;
  static const Field<Language, Locale> _f$locale = Field('locale', _$locale);
  static Currency _$currency(Language v) => v.currency;
  static const Field<Language, Currency> _f$currency = Field('currency', _$currency);

  @override
  final MappableFields<Language> fields = const {
    #id: _f$id,
    #name: _f$name,
    #imagePath: _f$imagePath,
    #urlCode: _f$urlCode,
    #locale: _f$locale,
    #currency: _f$currency,
  };

  static Language _instantiate(DecodingData data) {
    return Language(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        imagePath: data.dec(_f$imagePath),
        urlCode: data.dec(_f$urlCode),
        locale: data.dec(_f$locale),
        currency: data.dec(_f$currency));
  }

  @override
  final Function instantiate = _instantiate;

  static Language fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Language>(map);
  }

  static Language fromJson(String json) {
    return ensureInitialized().decodeJson<Language>(json);
  }
}

mixin LanguageMappable {
  String toJson() {
    return LanguageMapper.ensureInitialized().encodeJson<Language>(this as Language);
  }

  Map<String, dynamic> toMap() {
    return LanguageMapper.ensureInitialized().encodeMap<Language>(this as Language);
  }

  LanguageCopyWith<Language, Language, Language> get copyWith =>
      _LanguageCopyWithImpl(this as Language, $identity, $identity);
  @override
  String toString() {
    return LanguageMapper.ensureInitialized().stringifyValue(this as Language);
  }

  @override
  bool operator ==(Object other) {
    return LanguageMapper.ensureInitialized().equalsValue(this as Language, other);
  }

  @override
  int get hashCode {
    return LanguageMapper.ensureInitialized().hashValue(this as Language);
  }
}

extension LanguageValueCopy<$R, $Out> on ObjectCopyWith<$R, Language, $Out> {
  LanguageCopyWith<$R, Language, $Out> get $asLanguage => $base.as((v, t, t2) => _LanguageCopyWithImpl(v, t, t2));
}

abstract class LanguageCopyWith<$R, $In extends Language, $Out> implements ClassCopyWith<$R, $In, $Out> {
  CurrencyCopyWith<$R, Currency, Currency> get currency;
  $R call({int? id, String? name, String? imagePath, String? urlCode, Locale? locale, Currency? currency});
  LanguageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LanguageCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Language, $Out>
    implements LanguageCopyWith<$R, Language, $Out> {
  _LanguageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Language> $mapper = LanguageMapper.ensureInitialized();
  @override
  CurrencyCopyWith<$R, Currency, Currency> get currency => $value.currency.copyWith.$chain((v) => call(currency: v));
  @override
  $R call({int? id, String? name, String? imagePath, String? urlCode, Locale? locale, Currency? currency}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (imagePath != null) #imagePath: imagePath,
        if (urlCode != null) #urlCode: urlCode,
        if (locale != null) #locale: locale,
        if (currency != null) #currency: currency
      }));
  @override
  Language $make(CopyWithData data) => Language(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      imagePath: data.get(#imagePath, or: $value.imagePath),
      urlCode: data.get(#urlCode, or: $value.urlCode),
      locale: data.get(#locale, or: $value.locale),
      currency: data.get(#currency, or: $value.currency));

  @override
  LanguageCopyWith<$R2, Language, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LanguageCopyWithImpl($value, $cast, t);
}
