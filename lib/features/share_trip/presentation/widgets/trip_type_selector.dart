part of '../share_trip_view.dart';

class _TripTypeSelector extends StatelessWidget {
  const _TripTypeSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripTypeCubit, TripType>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.tripType,
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(
              height: AppDesignConstants.spacing,
            ),
            Row(
              children: [
                Expanded(
                  child: _TripTypeButton(
                    title: context.l10n.imLookingForCar,
                    isSelected: state == TripType.lookingDriver,
                    onTap: () {
                      context.read<TripTypeCubit>().setType(TripType.lookingDriver);
                    },
                  ),
                ),
                SizedBox(
                  width: AppDesignConstants.spacing,
                ),
                Expanded(
                  child: _TripTypeButton(
                    title: context.l10n.imLookingForPassenger,
                    isSelected: state == TripType.lookingPassenger,
                    onTap: () {
                      context.read<TripTypeCubit>().setType(TripType.lookingPassenger);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
