import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/auth/domain/repository/auth_repository.dart';

@injectable
final class SignUpUseCase {
  final AuthRepository _authRepository;

  const SignUpUseCase(this._authRepository);

  Future<Either<Failure, AuthResponse>> call(String email, String password, String name, String surname) async =>
      await _authRepository.register(email, password, name, surname);
}
