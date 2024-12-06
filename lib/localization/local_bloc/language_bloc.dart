import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/localization/languages/english.dart';
import 'package:unipool/localization/languages/turkish.dart';
import 'package:unipool/localization/models/language.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<LoadLanguage>(onLoadLanguage);
  }

  final supportedLanguages = [
    turkish,
    english,
  ];

  void onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  void onLoadLanguage(LoadLanguage event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(selectedLanguage: turkish));
  }
}
