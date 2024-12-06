import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageState(image: null, imageUrl: null));

  void selectImage(File file) {
    emit(ProfileImageState(image: file, imageUrl: null));
  }

  void reset() {
    emit(ProfileImageState(image: null, imageUrl: null));
  }

  void setImageUrl(String url) {
    emit(ProfileImageState(image: null, imageUrl: url));
  }
}

class ProfileImageState {
  final File? image;
  final String? imageUrl;

  ProfileImageState({
    required this.image,
    required this.imageUrl,
  });
}
