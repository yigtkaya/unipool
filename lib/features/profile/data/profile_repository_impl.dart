import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/domain/repository/profile_repository.dart';

@Injectable(as: ProfileRepository)
final class UserRepositoryImpl implements ProfileRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, ProfileModel>> fetchProfile(String id) async {
    try {
      final response = await supabase.from('profiles').select('''
        *,
        received_reviews:reviews!reviews_to_fkey(*)
      ''').eq('id', id).single();

      if (response.isEmpty) {
        return Left(Failure(message: 'No user found', code: '404'));
      }

      final user = ProfileModelMapper.fromMap(response);

      return Right(user);
    } on StorageException catch (e) {
      return Left(Failure(message: e.message, code: '500'));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updateProfile(ProfileModel profile) async {
    try {
      final response = await supabase
          .from('profiles')
          .upsert(profile.toMap())
          .eq(
            'id',
            profile.id.toString(),
          )
          .select()
          .single();

      if (response.isEmpty) {
        return Left(Failure(message: 'No user found', code: '404'));
      }

      final user = ProfileModelMapper.fromMap(response);

      return Right(user);
    } on StorageException catch (e) {
      return Left(
        Failure(
          message: e.message,
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePhoto(File image, String userId) async {
    try {
      final path = await supabase.storage.from('Users').upload(
            '$userId/profilePhoto.png',
            image,
            fileOptions: const FileOptions(
              cacheControl: '3600',
              upsert: true,
            ),
          );
      final url = "https://fozmblubybhxptzuctui.supabase.co/storage/v1/object/public/$path";

      await CachedNetworkImage.evictFromCache(url);

      return Right(url);
    } on StorageException catch (e) {
      return Left(
        Failure(
          message: e.message,
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadStudentPdf(File pdf, String userId) async {
    try {
      final path = await supabase.storage.from('Users').upload(
            '$userId/studentDocument.pdf',
            pdf,
            fileOptions: const FileOptions(
              cacheControl: '3600',
              upsert: true,
            ),
          );

      return Right("https://fozmblubybhxptzuctui.supabase.co/storage/v1/object/public/$path");
    } on StorageException catch (e) {
      return Left(
        Failure(
          message: e.message,
          code: '500',
        ),
      );
    }
  }
}
