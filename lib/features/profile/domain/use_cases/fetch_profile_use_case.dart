import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/domain/repository/profile_repository.dart';

@injectable
final class FetchProfileUseCase {
  final ProfileRepository _profileRepository;

  FetchProfileUseCase({required ProfileRepository profileRepository}) : _profileRepository = profileRepository;

  Future<Either<Failure, ProfileModel>> execute(String id) async {
    return _profileRepository.fetchProfile(id);
  }
}
