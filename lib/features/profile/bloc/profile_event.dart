part of 'profile_bloc.dart';

final class ProfileEvent extends BaseEvent {}

final class FetchProfileEvent extends ProfileEvent {
  final String id;

  FetchProfileEvent({required this.id});
}

final class UploadProfilePhotoEvent extends ProfileEvent {
  final File image;
  final String userId;

  UploadProfilePhotoEvent({required this.image, required this.userId});
}

final class UpdateProfileEvent extends ProfileEvent {
  final ProfileModel profile;

  UpdateProfileEvent({required this.profile});
}

final class UploadStudentPdfEvent extends ProfileEvent {
  final File pdf;
  final String userId;

  UploadStudentPdfEvent({required this.pdf, required this.userId});
}
