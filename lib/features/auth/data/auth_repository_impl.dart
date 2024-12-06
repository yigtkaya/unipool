// ignore_for_file: implementation_imports

import 'package:either_dart/src/either.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/auth/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, AuthResponse>> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.session != null) {
        return Right(response);
      }
      return Left(
        Failure(message: 'An error occurred', code: ''),
      );
    } on AuthException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    await supabase.rpc('delete_fcm_token', params: {'user_id': supabase.auth.currentUser!.id});
    await HydratedBloc.storage.clear();
    await supabase.auth.signOut();
    return const Right(null);
  }

  @override
  Future<Either<Failure, AuthResponse>> register(String email, String password, String name, String surname) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'surname': surname,
        },
      );

      if (response.user != null) {
        return Right(response);
      }
      return Left(
        Failure(message: 'An error occurred', code: ''),
      );
    } on AuthException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> sendResetPasswordEmail(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return const Right('OK');
    } on AuthException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code.toString(),
        ),
      );
    }
  }
}
