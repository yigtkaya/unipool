import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/core/bloc/base_bloc.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/my_trips/domain/use_cases/fetch_my_trips_use_case.dart';
import 'package:unipool/features/my_trips/domain/use_cases/invite_user_to_trip_use_case.dart';
import 'package:unipool/features/my_trips/domain/use_cases/share_trip_use_case.dart';
import 'package:unipool/features/share_trip/domain/models/share_trip_request_model.dart';

part 'my_trips_event.dart';
part 'my_trips_state.dart';

@injectable
final class MyTripsBloc extends BaseBloc<MyTripsEvent, MyTripsState> {
  final FetchMyTripsUseCase _fetchMyTripsUseCase;
  final ShareTripUseCase _shareTripUseCase;
  final InviteUserToTripUseCase _inviteUserToTripUseCase;

  MyTripsBloc(
    this._fetchMyTripsUseCase,
    this._shareTripUseCase,
    this._inviteUserToTripUseCase,
  ) : super(MyTripsInitial()) {
    on<LoadMyTrips>(_handleLoadMyTrips);
    on<FilterTrips>(_handleFilterTrips);
    on<ShareTrip>(_handleShareTrip);
    on<InviteUserToTrip>(_handleInviteUserToTrip);
  }

  void _handleFilterTrips(FilterTrips event, Emitter<MyTripsState> emit) {
    if (state is MyTripsLoaded) {
      final currentState = state as MyTripsLoaded;
      safeEmit(currentState.copyWith(selectedFilter: event.filter), emit);
    }
  }

  Future<void> _handleLoadMyTrips(
    LoadMyTrips event,
    Emitter<MyTripsState> emit,
  ) async {
    safeEmit(MyTripsLoading(), emit);

    final result = await _fetchMyTripsUseCase.call(event.userId);

    result.fold(
      (failure) => safeEmit(
        MyTripsError(
          errorMessage: failure.message,
        ),
        emit,
      ),
      (trips) {
        final upcomingTrips = trips
            .where(
              (response) =>
                  response.trip.status == TripStatus.active &&
                  DateTime.tryParse(response.trip.departureTime.toString()) != null &&
                  DateTime.tryParse(response.trip.departureTime.toString())!.isAfter(
                    DateTime.now(),
                  ),
            )
            .toList();
        final ongoingTrip = trips
            .where(
              (response) =>
                  response.trip.status == TripStatus.ongoing &&
                  DateTime.tryParse(response.trip.departureTime.toString()) != null &&
                  DateTime.tryParse(response.trip.departureTime.toString())!.isAfter(
                    DateTime.now(),
                  ) &&
                  DateTime.tryParse(response.trip.endAt.toString()) != null &&
                  DateTime.tryParse(response.trip.endAt.toString())!.isAfter(
                    DateTime.now(),
                  ),
            )
            .firstOrNull;
        final pastTrips = trips
            .where(
              (response) =>
                  response.trip.status == TripStatus.past &&
                  DateTime.tryParse(response.trip.endAt.toString()) != null &&
                  DateTime.tryParse(response.trip.endAt.toString())!.isBefore(
                    DateTime.now(),
                  ),
            )
            .toList();
        safeEmit(
          MyTripsLoaded(
            upcomingTrips: upcomingTrips,
            ongoingTrip: ongoingTrip,
            pastTrips: pastTrips,
          ),
          emit,
        );
      },
    );
  }

  Future<void> _handleShareTrip(ShareTrip event, Emitter<MyTripsState> emit) async {
    final result = await _shareTripUseCase.call(event.request);

    result.fold(
      (failure) => safeEmit(
        MyTripsError(
          errorMessage: failure.message,
        ),
        emit,
      ),
      (trip) => add(
        LoadMyTrips(
          userId: event.request.createdBy.toString(),
        ),
      ),
    );
  }

  void _handleInviteUserToTrip(InviteUserToTrip event, Emitter<MyTripsState> emit) async {
    final result = await _inviteUserToTripUseCase.call(event.request);

    result.fold(
      (failure) => safeEmit(
        MyTripsError(
          errorMessage: failure.message,
        ),
        emit,
      ),
      (response) => add(
        LoadMyTrips(
          userId: event.request.inviterId.toString(),
        ),
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(MyTripsState state) {
    if (state is MyTripsLoaded) {
      return {
        'upcoming_trips': state.upcomingTrips,
        'ongoing_trip': state.ongoingTrip,
        'past_trips': state.pastTrips,
      };
    }
    return null;
  }

  @override
  MyTripsState? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      final upcomingTrips =
          (json['upcoming_trips'] as List).map((trip) => TripsResponseModelMapper.fromJson(trip)).toList();

      final ongoingTrip = json['ongoing_trip'] != null ? TripsResponseModelMapper.fromJson(json['ongoing_trip']) : null;

      final pastTrips = (json['past_trips'] as List).map((trip) => TripsResponseModelMapper.fromJson(trip)).toList();

      return MyTripsLoaded(
        upcomingTrips: upcomingTrips,
        ongoingTrip: ongoingTrip,
        pastTrips: pastTrips,
      );
    }
    return null;
  }
}
