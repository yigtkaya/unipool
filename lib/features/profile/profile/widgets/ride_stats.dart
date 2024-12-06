part of '../profile_view.dart';

final class RideStats extends StatelessWidget {
  const RideStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const _RideStatsShimmer();
        }

        if (state is ProfileLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(
                title: context.l10n.totalRides,
                value: '102',
                iconName: AssetConstants.icons.car,
              ),
              _StatItem(
                title: context.l10n.completed,
                value: '87',
                iconName: AssetConstants.icons.completed,
                backgroundColor: AppColors.kSuccess100,
                valueColor: AppColors.kSuccess400,
              ),
              _StatItem(
                title: context.l10n.cancelled,
                value: '15',
                iconName: AssetConstants.icons.cancel,
                backgroundColor: AppColors.kDanger100,
                valueColor: AppColors.kDanger400,
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

final class _RideStatsShimmer extends StatelessWidget {
  const _RideStatsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          AppColors.kWhite,
          AppColors.kGreyLight1,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatItem(
            title: context.l10n.totalRides,
            value: '102',
            iconName: AssetConstants.icons.totalRides,
          ),
          _StatItem(
            title: context.l10n.completed,
            value: '102',
            iconName: AssetConstants.icons.totalRides,
          ),
          _StatItem(
            title: context.l10n.cancelled,
            value: '102',
            iconName: AssetConstants.icons.totalRides,
          ),
        ],
      ),
    );
  }
}
