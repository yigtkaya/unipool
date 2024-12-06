part of '../share_trip_view.dart';

mixin _ShareButtonMixin on State<_ShareButton> {
  void _handleShare() {
    final tripType = context.read<TripTypeCubit>().state;
    final tripRoute = context.read<TripRouteCubit>().state;
    final tripTime = context.read<TripTimeCubit>().state;
    final passengerCount = context.read<PassengerCountCubit>().state;

    if (tripRoute.from == null || tripRoute.to == null || tripTime == null) {
      CustomToastMessage.showCustomToast(
        context,
        context.l10n.plaseFillInAllTheFields,
        AppColors.kDanger400,
      );
      return;
    }

    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;

    final request = ShareTripRequestModel(
      startDestination: tripRoute.from!,
      finalDestination: tripRoute.to!,
      type: tripType.name,
      departureTime: tripTime.toIso8601String(),
      passengerLimit: passengerCount,
      status: TripStatus.active.name,
      createdBy: userId,
      createdAt: DateTime.now().toIso8601String(),
    );

    context.read<MyTripsBloc>().add(
          ShareTrip(
            request: request,
          ),
        );
  }
}
