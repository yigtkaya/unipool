part of '../landing_page_view.dart';

final class TripListItem extends StatelessWidget {
  final TripsResponseModel tripResponseModel;
  const TripListItem({super.key, required this.tripResponseModel});

  @override
  Widget build(BuildContext context) {
    final departureTime = DateTime.tryParse(tripResponseModel.trip.departureTime.toString())!.formatForTripItem();
    return Card(
      color: AppColors.kWhite,
      shadowColor: AppColors.kGrey,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
      ),
      child: InkWell(
        splashColor: AppColors.kPrimary50,
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
        onTap: () {
          // show trip details bottom sheet
          DraggableScrollableActuator.reset(context);

          showBarModalBottomSheet(
            context: context,
            builder: (context) => TripDetailsBottomSheet(tripResponseModel: tripResponseModel),
          );
        },
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
              Row(
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
                      PullDownMenuItem(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: context.l10n.report,
                        icon: LucideIcons.flag,
                        iconColor: AppColors.kDanger400,
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
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              // Driver info
              DriverInfo(
                profile: tripResponseModel.ownerProfile,
                isOwner: false,
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              LocationDisplayForListItem(
                pickupAddress: tripResponseModel.trip.startDestination.addressLine1.toString(),
                dropoffAddress: tripResponseModel.trip.finalDestination.addressLine1.toString(),
                isDropoffOptional: true,
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              // Remaining seats chip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.kPrimary100,
                      borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.horizontalPaddingMedium,
                      vertical: AppDesignConstants.verticalPaddingSmall,
                    ),
                    child: Center(
                      child: Text(
                        tripResponseModel.trip.type == TripType.lookingPassenger
                            ? context.l10n.imLookingForPassenger
                            : context.l10n.imLookingForCar,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  ),
                  RemainingSeatsChip(
                    totalSeats: tripResponseModel.trip.passengerLimit!,
                    remainingSeats: tripResponseModel.trip.passengerLimit! - tripResponseModel.passengers.length,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
