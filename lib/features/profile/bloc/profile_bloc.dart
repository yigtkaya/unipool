import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/bloc/base_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/domain/use_cases/fetch_profile_use_case.dart';
import 'package:unipool/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:unipool/features/profile/domain/use_cases/upload_profile_photo_use_case.dart';
import 'package:unipool/features/profile/domain/use_cases/upload_student_pdf_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
final class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final FetchProfileUseCase _fetchProfileUseCase;
  final UploadProfilePhotoUseCase _uploadProfilePhotoUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UploadStudentPdfUseCase _uploadStudentPdfUseCase;

  ProfileBloc(
    this._fetchProfileUseCase,
    this._uploadProfilePhotoUseCase,
    this._updateProfileUseCase,
    this._uploadStudentPdfUseCase,
  ) : super(ProfileInitial()) {
    on<FetchProfileEvent>(_onProfileFetch);
    on<UploadProfilePhotoEvent>(_onUploadProfilePhoto);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UploadStudentPdfEvent>(_onUploadStudentPdf);
  }

  Future<void> _onProfileFetch(FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await _fetchProfileUseCase.execute(event.id);

    result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.message,
        ),
      ),
      (profile) => emit(
        ProfileLoaded(
          profile: profile,
        ),
      ),
    );
  }

  Future<void> _onUploadProfilePhoto(UploadProfilePhotoEvent event, Emitter<ProfileState> emit) async {
    final currentProfile = (state as ProfileLoaded).profile;
    emit(ProfileLoading());
    final result = await _uploadProfilePhotoUseCase.execute(event.image, event.userId);

    if (result.isRight) {
      emit(
        ProfileLoaded(
          profile: currentProfile.copyWith(profilePhoto: result.right),
        ),
      );
      return;
    }

    emit(ProfileError(message: result.left.message));
  }

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await _updateProfileUseCase.execute(event.profile);

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (profile) => emit(ProfileLoaded(profile: profile)),
    );
  }

  Future<void> _onUploadStudentPdf(UploadStudentPdfEvent event, Emitter<ProfileState> emit) async {
    final currentProfile = (state as ProfileLoaded).profile;
    emit(ProfileLoading());
    final result = await _uploadStudentPdfUseCase.execute(event.pdf, event.userId);

    if (result.isRight) {
      final response = await _updateProfileUseCase.execute(currentProfile.copyWith(studentDocument: result.right));

      if (response.isRight) {
        emit(ProfileLoaded(profile: response.right));
      } else {
        emit(ProfileError(message: response.left.message));
      }
      return;
    }

    emit(ProfileError(message: result.left.message));
  }
}
