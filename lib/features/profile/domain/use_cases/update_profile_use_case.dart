import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/domain/repository/profile_repository.dart';

@injectable
final class UpdateProfileUseCase {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  Future<Either<Failure, ProfileModel>> execute(ProfileModel profile) async {
    return _profileRepository.updateProfile(profile);
  }
}
