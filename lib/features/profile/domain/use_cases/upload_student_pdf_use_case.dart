import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/repository/profile_repository.dart';

@injectable
final class UploadStudentPdfUseCase {
  final ProfileRepository _profileRepository;

  UploadStudentPdfUseCase(this._profileRepository);

  Future<Either<Failure, String>> execute(File pdf, String userId) async {
    return _profileRepository.uploadStudentPdf(pdf, userId);
  }
}
