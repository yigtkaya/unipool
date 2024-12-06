part of '../profile_view.dart';

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final String iconName;
  final Color backgroundColor;
  final Color valueColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const _StatItem({
    required this.title,
    required this.value,
    required this.iconName,
    this.backgroundColor = AppColors.kWhite,
    this.valueColor = Colors.black,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.r),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusMedium,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.kPrimary7.withOpacity(0.08),
                blurRadius: 8.r,
                offset: const Offset(0, 4),
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingSmall,
            vertical: AppDesignConstants.verticalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and Title Row
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: (iconColor ?? valueColor).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: AssetIcon(
                      iconName: iconName,
                      width: 18.r,
                      color: iconColor ?? valueColor,
                    ),
                  ),
                  SizedBox(width: 8.r),
                  Flexible(
                    child: Text(
                      title,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.kSecondary700,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.r),
              // Value with Animation
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: double.tryParse(value) ?? 0),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Text(
                    value.toInt().toString(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: valueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  );
                },
              ),
              // Optional Trend Indicator
              if (onTap != null) ...[
                SizedBox(height: 8.r),
                Row(
                  children: [
                    Icon(
                      LucideIcons.trending_up,
                      size: 14.r,
                      color: AppColors.kSuccess400,
                    ),
                    SizedBox(width: 4.r),
                    Text(
                      '+12% vs last month',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.kSuccess400,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
