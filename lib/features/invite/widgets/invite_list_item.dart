part of '../invite_list_sheet.dart';

final class InviteListItem extends StatelessWidget {
  final TripsResponseModel trip;
  const InviteListItem({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InviteSelectionCubit, InviteSelectionState>(
      builder: (context, state) {
        final isSelected = state.selectedTrip?.trip.tripId == trip.trip.tripId;
        return Card(
          color: isSelected ? AppColors.kPrimary100 : AppColors.kWhite,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
          ),
          child: InkWell(
            splashColor: AppColors.kPrimary50,
            borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
            onTap: () {
              context.read<InviteSelectionCubit>().selectTrip(trip);
            },
            child: Padding(
              padding: EdgeInsets.all(AppDesignConstants.spacingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateTime.tryParse(trip.trip.departureTime.toString())!.formatForTripItem(),
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppDesignConstants.spacingMedium),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePhoto(
                        profilePhoto: trip.ownerProfile.profilePhoto ?? '',
                      ),
                      SizedBox(width: AppDesignConstants.spacingMedium),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.from,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: isSelected ? AppColors.kBlack : AppColors.kGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              trip.trip.startDestination.addressLine1.toString(),
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              l10n.to,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: isSelected ? AppColors.kBlack : AppColors.kGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              trip.trip.finalDestination.addressLine1.toString(),
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDesignConstants.spacingMedium),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
