import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class BirthdayCubit extends Cubit<DateTime?> {
  BirthdayCubit() : super(null);

  void setBirthday(DateTime? birthday) {
    emit(birthday);
  }
}
