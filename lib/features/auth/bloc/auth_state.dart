part of 'auth_bloc.dart';

sealed class AuthState extends BaseState {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthError extends AuthState {
  final Failure failure;
  const AuthError({required this.failure});

  @override
  List<Object> get props => [failure];
}
