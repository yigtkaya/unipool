part of '../share_trip_view.dart';

final class _PassengerCountSelection extends StatelessWidget {
  final int maxCount;

  const _PassengerCountSelection({
    this.maxCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripTypeCubit, TripType>(
      builder: (context, state) {
        if (state != TripType.lookingPassenger) {
          return SizedBox(
            height: AppDesignConstants.spacingLarge * 2,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.passengerLimit,
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: AppDesignConstants.spacing),
            Text(
              context.l10n.passengerLimitDescription,
              style: context.textTheme.bodySmall,
            ),
            BlocBuilder<PassengerCountCubit, int>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                      onPressed: state > 1
                          ? () {
                              context.read<PassengerCountCubit>().decrement();
                            }
                          : null,
                      padding: EdgeInsets.zero,
                      color: state > 1 ? AppColors.kSecondary700 : AppColors.kSecondary400,
                      borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          LucideIcons.minus,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        state.toString(),
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: state != maxCount
                          ? () {
                              context.read<PassengerCountCubit>().increment();
                            }
                          : null,
                      padding: EdgeInsets.zero,
                      color: state != maxCount ? AppColors.kPrimary100 : AppColors.kSecondary400,
                      borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          LucideIcons.plus,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 2,
            ),
          ],
        );
      },
    );
  }
}
