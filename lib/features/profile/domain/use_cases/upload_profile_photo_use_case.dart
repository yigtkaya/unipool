import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class UploadProfilePhotoUseCase {
  final ProfileRepository _profileRepository;

  UploadProfilePhotoUseCase(this._profileRepository);

  Future<Either<Failure, String>> execute(File image, String userId) async {
    return _profileRepository.uploadProfilePhoto(image, userId);
  }
}
