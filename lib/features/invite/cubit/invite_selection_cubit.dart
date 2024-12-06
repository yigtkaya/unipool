import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';

class InviteSelectionState {
  final TripsResponseModel? selectedTrip;

  const InviteSelectionState({this.selectedTrip});

  InviteSelectionState copyWith({TripsResponseModel? selectedTrip}) {
    return InviteSelectionState(
      selectedTrip: selectedTrip ?? this.selectedTrip,
    );
  }
}

@injectable
final class InviteSelectionCubit extends Cubit<InviteSelectionState> {
  InviteSelectionCubit() : super(const InviteSelectionState());

  void selectTrip(TripsResponseModel trip) {
    emit(state.copyWith(selectedTrip: trip));
  }

  void clearSelection() {
    emit(const InviteSelectionState());
  }
}
