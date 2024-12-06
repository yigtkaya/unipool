import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/auth/domain/repository/auth_repository.dart';

@injectable
final class LogoutUseCase {
  final AuthRepository _authRepository;

  const LogoutUseCase(this._authRepository);

  Future<Either<Failure, void>> call() async => await _authRepository.logout();
}
