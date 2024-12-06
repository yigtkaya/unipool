part of '../landing_page_view.dart';

final class MapFilterSearchBar extends StatelessWidget {
  const MapFilterSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: context.l10n.searchForLocation,
                    hintStyle: context.textTheme.bodyMedium!.copyWith(color: AppColors.kGrey),
                    prefixIcon: Icon(LucideIcons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.horizontalPaddingMedium,
                      vertical: AppDesignConstants.verticalPaddingMedium,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.kGreyLight2,
                    ),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      // TODO: Implement time filter functionality
                      debugPrint('Selected time: ${selectedTime.format(context)}');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
