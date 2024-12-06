part of 'auth_bloc.dart';

abstract base class AuthEvent extends BaseEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

final class CheckAuthStatusEvent extends AuthEvent {}

final class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String surname;

  SignUpEvent(this.email, this.password, this.name, this.surname);
}

final class ForgotPasswordEvent extends AuthEvent {
  final String email;

  ForgotPasswordEvent(this.email);
}

final class LogOutEvent extends AuthEvent {}

final class AuthStateChangedEvent extends AuthEvent {
  final AuthChangeEvent event;
  final Session? session;

  AuthStateChangedEvent(this.event, this.session);
}
