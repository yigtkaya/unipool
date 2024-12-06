import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenderCubit extends Cubit<String?> {
  GenderCubit() : super(null);

  void setGender(String value) {
    emit(value);
  }
}
