import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';

@injectable
final class TripTypeCubit extends Cubit<TripType> {
  TripTypeCubit() : super(TripType.lookingDriver);

  void setType(TripType type) {
    emit(type);
  }
}
