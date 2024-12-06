import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

@injectable
final class TripRouteCubit extends Cubit<TripRouteState> {
  TripRouteCubit() : super(TripRouteState(from: null, to: null));

  void setFrom(GeoapifyPlace from) {
    emit(TripRouteState(from: from, to: state.to));
  }

  void setTo(GeoapifyPlace to) {
    emit(TripRouteState(from: state.from, to: to));
    print(state.to);
  }

  void reset() {
    emit(TripRouteState(from: null, to: null));
  }

  void swapFromTo() {
    emit(TripRouteState(from: state.to, to: state.from));
  }
}

class TripRouteState {
  final GeoapifyPlace? from;
  final GeoapifyPlace? to;

  TripRouteState({required this.from, required this.to});
}
