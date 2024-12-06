import 'package:either_dart/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(String email, String password);
  Future<Either<Failure, AuthResponse>> register(String email, String password, String name, String surname);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, String>> sendResetPasswordEmail(String email);
}
