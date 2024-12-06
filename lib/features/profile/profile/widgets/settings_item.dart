part of '../profile_view.dart';

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.subtitle,
    this.switchValue,
    this.onSwitchChanged,
  }) : assert(
          (onTap != null && switchValue == null && onSwitchChanged == null) ||
              (onTap == null && switchValue != null && onSwitchChanged != null),
          'Either provide onTap or switchValue with onSwitchChanged, not both',
        );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      toggled: switchValue,
      label: '$title setting',
      child: CupertinoListTile(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingSmall,
        ),
        leading: Icon(
          icon,
          color: AppColors.kPrimary100,
          size: 26.r,
        ),
        title: Text(
          title,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: 17.sp,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: switchValue != null
            ? CupertinoSwitch(
                value: switchValue!,
                onChanged: onSwitchChanged!,
              )
            : Icon(
                CupertinoIcons.chevron_right,
                color: AppColors.kGrey,
                size: 20.r,
              ),
        onTap: onTap != null
            ? () {
                HapticFeedback.lightImpact();
                onTap!();
              }
            : null,
      ),
    );
  }
}
