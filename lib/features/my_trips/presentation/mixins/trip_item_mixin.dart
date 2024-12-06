part of '../my_trips_view.dart';

mixin _TripItemMixin on State<_TripItem> {
  late String departureTime;
  late bool isOwner;

  @override
  void initState() {
    departureTime = DateTime.tryParse(widget.response.trip.departureTime.toString())!.formatForTripItem();
    isOwner = widget.response.trip.createdBy == (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;

    super.initState();
  }

  void onTripItemPressed() {
    showBarModalBottomSheet(
      context: context,
      backgroundColor: AppColors.kWhite,
      duration: const Duration(milliseconds: 300),
      expand: false,
      builder: (context) => TripDetailsBottomSheet(
        response: widget.response,
        isOwner: isOwner,
      ),
    );
  }
}
