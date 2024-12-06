import 'package:flutter/material.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/localization/models/currency.dart';

part 'language.mapper.dart';

@MappableClass(discriminatorKey: "id")
class Language with LanguageMappable {
  const Language({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.urlCode,
    required this.locale,
    required this.currency,
  });

  final int id;
  final String name;
  final String imagePath;
  final String urlCode;
  final Locale locale;
  final Currency currency;
}
