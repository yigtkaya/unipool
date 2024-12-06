import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/app/handlers/location_handler.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
final class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationHandler _locationHandler;
  StreamSubscription<LatLng>? _locationSubscription;

  LocationBloc({
    required LocationHandler locationHandler,
  })  : _locationHandler = locationHandler,
        super(LocationInitial()) {
    on<StartLocationUpdates>(_onStartLocationUpdates);
    on<LocationUpdated>(_onLocationUpdated);
    on<StopLocationUpdates>(_onStopLocationUpdates);
  }

  Future<void> _onStartLocationUpdates(
    StartLocationUpdates event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());

    try {
      await _locationHandler.initialize();
      final initialLocation = await _locationHandler.getCurrentLocation();

      _locationSubscription?.cancel();
      _locationSubscription = _locationHandler.locationStream.listen(
        (LatLng location) => add(LocationUpdated(location)),
      );

      emit(LocationSuccess(location: initialLocation));
    } catch (error) {
      emit(LocationFailure(error: error.toString()));
    }
  }

  void _onLocationUpdated(
    LocationUpdated event,
    Emitter<LocationState> emit,
  ) {
    if (state is LocationSuccess) {
      emit(LocationSuccess(location: event.location));
    }
  }

  Future<void> _onStopLocationUpdates(
    StopLocationUpdates event,
    Emitter<LocationState> emit,
  ) async {
    _locationSubscription?.cancel();
    _locationHandler.dispose();
    emit(LocationInitial());
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    _locationHandler.dispose();
    return super.close();
  }
}
