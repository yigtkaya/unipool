part of '../share_trip_view.dart';

class _TripTypeButton extends StatelessWidget {
  const _TripTypeButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(title),
      labelPadding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingMedium,
        vertical: AppDesignConstants.verticalPaddingSmall,
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      checkmarkColor: AppColors.kWhite,
      backgroundColor: AppColors.kWhite,
      selectedColor: AppColors.kPrimary100,
      labelStyle: context.textTheme.bodyMedium!.copyWith(
        color: isSelected ? AppColors.kWhite : AppColors.kBlack,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? Colors.transparent : AppColors.kGrey,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusSmall),
      ),
    );
  }
}
