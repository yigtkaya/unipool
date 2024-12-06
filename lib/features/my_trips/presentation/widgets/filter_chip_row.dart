part of '../my_trips_view.dart';

final class FilterChipRow extends StatelessWidget {
  const FilterChipRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MyTripsBloc, MyTripsState>(
        builder: (context, state) {
          if (state is! MyTripsLoaded) return const SizedBox.shrink();

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDesignConstants.horizontalPaddingMedium,
              vertical: AppDesignConstants.verticalPaddingMedium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _AnimatedFilterChip(
                  label: context.l10n.driver,
                  isSelected: state.selectedFilter == TripFilter.driver,
                  onTap: () => context.read<MyTripsBloc>().add(
                        FilterTrips(filter: TripFilter.driver),
                      ),
                ),
                SizedBox(width: 8.w),
                _AnimatedFilterChip(
                  label: context.l10n.passenger,
                  isSelected: state.selectedFilter == TripFilter.passenger,
                  onTap: () => context.read<MyTripsBloc>().add(
                        FilterTrips(filter: TripFilter.passenger),
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AnimatedFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AnimatedFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: label,
            style: context.textTheme.bodyMedium,
          ),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout();

        final textWidth = textPainter.size.width + 48.w;

        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isSelected ? textWidth : 48.w,
            padding: EdgeInsets.symmetric(
              vertical: AppDesignConstants.verticalPaddingMedium,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.kPrimary100 : AppColors.kWhite,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: isSelected ? AppColors.kPrimary100 : AppColors.kGrey,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getIconForLabel(label, context),
                  size: 20.w,
                  color: isSelected ? AppColors.kWhite : AppColors.kGrey,
                ),
                if (isSelected) ...[
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      label,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? AppColors.kWhite : AppColors.kPrimary100,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getIconForLabel(String label, BuildContext context) {
    if (label == context.l10n.driver) {
      return Icons.drive_eta_rounded;
    }
    if (label == context.l10n.passenger) {
      return Icons.person_rounded;
    }
    return Icons.circle;
  }
}
