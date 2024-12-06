import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/auth/domain/repository/auth_repository.dart';

@injectable
final class LoginUseCase {
  final AuthRepository _authRepository;

  const LoginUseCase(this._authRepository);

  Future<Either<Failure, AuthResponse>> call(String email, String password) async =>
      await _authRepository.login(email, password);
}
