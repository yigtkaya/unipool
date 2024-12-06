part of 'profile_bloc.dart';

sealed class ProfileState extends BaseState {
  const ProfileState();

  @override
  List<Object?> get props => [];

  ProfileState copyWith() => this;
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profile;

  const ProfileLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];

  @override
  ProfileLoaded copyWith({
    ProfileModel? profile,
  }) {
    return ProfileLoaded(
      profile: profile ?? this.profile,
    );
  }
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  ProfileError copyWith({
    String? message,
  }) {
    return ProfileError(
      message: message ?? this.message,
    );
  }
}
