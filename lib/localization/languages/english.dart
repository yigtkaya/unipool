import 'package:flutter/material.dart';
import 'package:unipool/core/constants/asset_constants.dart';
import 'package:unipool/localization/models/currency.dart';
import 'package:unipool/localization/models/language.dart';

Language english = Language(
  id: 1,
  name: 'English',
  imagePath: AssetConstants.images.unitedKingdomFlag,
  urlCode: 'en',
  locale: Locale('en'),
  currency: englishCurrency,
);

const Currency englishCurrency = Currency(
  code: "840",
  name: 'US Dollar',
  shortName: 'USD',
  symbol: r'$',
);
