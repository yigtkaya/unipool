import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class TripTimeCubit extends Cubit<DateTime?> {
  TripTimeCubit() : super(DateTime.now());

  void setDate(DateTime date) {
    emit(date);
  }

  void reset() {
    emit(null);
  }
}
