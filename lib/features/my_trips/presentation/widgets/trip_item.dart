part of '../my_trips_view.dart';

final class _TripItem extends StatefulWidget {
  final TripsResponseModel response;

  const _TripItem({
    required this.response,
  });

  @override
  State<_TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<_TripItem> with _TripItemMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kWhite,
      shadowColor: AppColors.kGrey,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusMedium,
        ),
      ),
      child: InkWell(
        splashColor: AppColors.kPrimary50,
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusMedium,
        ),
        onTap: onTripItemPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
            vertical: AppDesignConstants.verticalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with date and status
              SizedBox(
                height: AppDesignConstants.spacing,
              ),
              Hero(
                tag: 'trip_header_${widget.response.trip.tripId}',
                child: Material(
                  type: MaterialType.transparency,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        departureTime,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      PullDownButton(
                        position: PullDownMenuPosition.over,
                        itemBuilder: (context) => [
                          if (isOwner)
                            PullDownMenuItem(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: context.l10n.edit,
                              icon: LucideIcons.pen,
                            ),
                          PullDownMenuItem(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: context.l10n.cancelTrip,
                            icon: LucideIcons.trash,
                            isDestructive: true,
                          ),
                        ],
                        buttonBuilder: (context, showMenu) => CupertinoButton(
                          onPressed: showMenu,
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            LucideIcons.ellipsis_vertical,
                            size: 24,
                            color: AppColors.kBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              // Driver info
              Hero(
                tag: 'driver_info_${widget.response.trip.tripId}',
                child: DriverInfo(
                  profile: widget.response.ownerProfile,
                  isOwner: isOwner,
                ),
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              Hero(
                tag: 'location_display_${widget.response.trip.tripId}',
                child: SingleChildScrollView(
                  child: LocationDisplay(
                    pickupAddress: widget.response.trip.startDestination.formatted.toString(),
                    dropoffAddress: widget.response.trip.finalDestination.formatted.toString(),
                    isDropoffOptional: true,
                  ),
                ),
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              // Remaining seats chip
              RemainingSeatsChip(
                totalSeats: widget.response.trip.passengerLimit!,
                remainingSeats: widget.response.trip.passengerLimit! - widget.response.passengers.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
