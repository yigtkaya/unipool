import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class DepartmentCubit extends Cubit<String?> {
  DepartmentCubit() : super(null);

  void setDepartment(String value) {
    emit(value);
  }
}
