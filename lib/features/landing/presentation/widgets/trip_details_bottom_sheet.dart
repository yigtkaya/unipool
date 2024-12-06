part of '../landing_page_view.dart';

final class TripDetailsBottomSheet extends StatefulWidget {
  final TripsResponseModel tripResponseModel;

  const TripDetailsBottomSheet({
    super.key,
    required this.tripResponseModel,
  });

  @override
  State<TripDetailsBottomSheet> createState() => _TripDetailsBottomSheetState();
}

class _TripDetailsBottomSheetState extends State<TripDetailsBottomSheet> with TripDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDesignConstants.borderRadiusMedium),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppDesignConstants.horizontalPaddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            Text(
              context.l10n.tripInformation,
              textAlign: TextAlign.start,
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              widget.tripResponseModel.trip.type == TripType.lookingDriver
                  ? context.l10n.inviteThisUserToYourTrip
                  : context.l10n.sendRequestToJoinThisTrip(context.l10n.passenger),
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.kGrey,
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            DriverInfo(
              profile: widget.tripResponseModel.ownerProfile,
              isOwner: true,
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 1.5,
            ),
            LocationDisplay(
              pickupAddress: widget.tripResponseModel.trip.startDestination.formatted.toString(),
              dropoffAddress: widget.tripResponseModel.trip.finalDestination.formatted.toString(),
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 1.5,
            ),
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
                      widget.tripResponseModel.trip.type == TripType.lookingPassenger
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
                  totalSeats: widget.tripResponseModel.trip.passengerLimit!,
                  remainingSeats:
                      widget.tripResponseModel.trip.passengerLimit! - widget.tripResponseModel.passengers.length,
                ),
              ],
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 1.5,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: () => onInvitePressed(
                  widget.tripResponseModel.ownerProfile,
                  widget.tripResponseModel.trip,
                ),
                color: AppColors.kPrimary100,
                child: Text(
                  widget.tripResponseModel.trip.type == TripType.lookingDriver
                      ? context.l10n.invite
                      : context.l10n.requestToJoin,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
