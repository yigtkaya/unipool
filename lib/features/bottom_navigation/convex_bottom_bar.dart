part of 'root_view.dart';

final class CustomConvexBottomBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  const CustomConvexBottomBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: Colors.white,
      activeColor: tabsRouter.activeIndex != 2 ? AppColors.kPrimary100 : null,
      color: AppColors.kGrey,
      curveSize: 90,
      top: -20,
      height: 64.h,
      items: [
        TabItem(
          icon: LucideIcons.car,
          title: context.l10n.trips,
        ),
        TabItem(
          icon: LucideIcons.message_circle,
          title: context.l10n.messages,
        ),
        TabItem(
          icon: Padding(
            padding: EdgeInsets.all(
              AppDesignConstants.horizontalPaddingMedium,
            ),
            child: AssetIcon(
              iconName: AssetConstants.icons.addTrip,
              color: AppColors.kWhite,
              width: 24,
            ),
          ),
          title: '',
        ),
        TabItem(
          icon: LucideIcons.ticket_check,
          title: context.l10n.myTrips,
        ),
        TabItem(icon: LucideIcons.user_round, title: context.l10n.profile),
      ],
      initialActiveIndex: tabsRouter.activeIndex,
      onTap: (index) => _handleTap(context, index),
    );
  }

  void _handleTap(BuildContext context, int index) async {
    if (index == 2) {
      // Middle button - show bottom sheet
      await showBarModalBottomSheet(
        context: context,
        expand: false,
        builder: (context) => const ShareTripView(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              AppDesignConstants.borderRadiusMedium,
            ),
          ),
        ),
      );
    } else {
      // Other buttons - normal navigation
      tabsRouter.setActiveIndex(index);
    }
  }
}
