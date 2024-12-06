import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/landing/domain/use_cases/get_filtered_trips.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';

part 'trips_state.dart';
part 'trips_event.dart';

@injectable
final class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final FilterTripsUseCase filterTripsUseCase;

  TripsBloc({required this.filterTripsUseCase}) : super(TripsInitial()) {
    on<FilterTripsEvent>(_onFilterTrips);
  }

  Future<void> _onFilterTrips(FilterTripsEvent event, Emitter<TripsState> emit) async {
    emit(TripsLoading());
    final result = await filterTripsUseCase.call(
      from: event.from,
      to: event.to,
      dateTime: event.dateTime,
      userId: event.userId,
    );

    emit(
      TripsLoaded(
        result,
      ),
    );
  }
}
