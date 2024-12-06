import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/bloc/base_bloc.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:unipool/features/auth/domain/use_cases/login_use_case.dart';
import 'package:unipool/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:unipool/features/auth/domain/use_cases/sign_up_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  AuthBloc(
    this._loginUseCase,
    this._signUpUseCase,
    this._logoutUseCase,
    this._forgotPasswordUseCase,
  ) : super(AuthInitial()) {
    on<CheckAuthStatusEvent>(_checkAuthStatus);
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
    on<LogOutEvent>(_logout);
    on<ForgotPasswordEvent>(_forgotPassword);
  }

  Future<void> _checkAuthStatus(CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      safeEmit(AuthSuccess(user: session.user), emit);
    } else {
      safeEmit(AuthInitial(), emit);
    }
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);

    final result = await _loginUseCase.call(event.email, event.password);

    result.fold(
      (failure) => safeEmit(AuthError(failure: failure), emit),
      (response) => safeEmit(AuthSuccess(user: response.session!.user), emit),
    );
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);

    final result = await _signUpUseCase.call(event.email, event.password, event.name, event.surname);

    result.fold(
      (failure) => safeEmit(AuthError(failure: failure), emit),
      (response) => safeEmit(AuthSuccess(user: response.session!.user), emit),
    );
  }

  Future<void> _logout(LogOutEvent event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);

    final result = await _logoutUseCase.call();

    result.fold(
      (failure) => safeEmit(AuthError(failure: failure), emit),
      (response) => safeEmit(AuthInitial(), emit),
    );
  }

  Future<void> _forgotPassword(ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    final currentState = state;
    safeEmit(AuthLoading(), emit);

    await _forgotPasswordUseCase.call(event.email);

    safeEmit(currentState, emit);
  }
}
