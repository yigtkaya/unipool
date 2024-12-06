import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class PassengerCountCubit extends Cubit<int> {
  PassengerCountCubit() : super(1);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void set(int count) {
    emit(count);
  }
}
