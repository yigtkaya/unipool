part of '../profile_view.dart';

final class _ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kWhite,
      surfaceTintColor: AppColors.kWhite,
      title: Text(
        context.l10n.profile,
        style: context.textTheme.titleSmall,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: IconButton(
            onPressed: () {
              context.router.push(
                const EditProfileRoute(),
              );
            },
            icon: const Icon(
              LucideIcons.user_pen,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
