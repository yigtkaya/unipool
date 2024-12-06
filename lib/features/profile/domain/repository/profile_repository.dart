import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, ProfileModel>> fetchProfile(String id);
  Future<Either<Failure, String>> uploadProfilePhoto(File image, String userId);
  Future<Either<Failure, String>> uploadStudentPdf(File pdf, String userId);
  Future<Either<Failure, ProfileModel>> updateProfile(ProfileModel profile);
}
