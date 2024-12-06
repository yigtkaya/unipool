import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SchoolCubit extends Cubit<String?> {
  SchoolCubit() : super(null);

  void setSchool(String value) {
    emit(value);
  }
}
