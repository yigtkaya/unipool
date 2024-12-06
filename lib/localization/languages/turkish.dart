import 'package:flutter/material.dart';
import 'package:unipool/core/constants/asset_constants.dart';
import 'package:unipool/localization/models/currency.dart';
import 'package:unipool/localization/models/language.dart';

Language turkish = Language(
  id: 0,
  name: 'Türkçe',
  imagePath: AssetConstants.images.turkishFlag,
  urlCode: 'tr',
  locale: Locale('tr'),
  currency: turkishCurrency,
);

const Currency turkishCurrency = Currency(
  code: "784",
  name: 'Turkish Lira',
  shortName: 'TL',
  symbol: '₺',
);
