import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class StudentPdfCubit extends Cubit<File?> {
  StudentPdfCubit() : super(null);

  void setPDF(File? file) {
    emit(file);
  }
}
