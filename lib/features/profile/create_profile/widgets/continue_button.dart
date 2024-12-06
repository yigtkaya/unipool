part of '../create_profile_view.dart';

final class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onContinueRoute;
  final bool shouldExecuteContinueRoute;

  const ContinueButton({
    super.key,
    required this.onPressed,
    required this.onContinueRoute,
    required this.shouldExecuteContinueRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (!context.mounted) return;

        if (state is ProfileLoading) {
          CustomOverlayLoader.show(
            context,
            indicatorType: Indicator.ballClipRotatePulse,
          );
        } else if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is ProfileError) {
          CustomToastMessage.showCustomToast(
            context,
            state.message,
            AppColors.kDanger400,
          );
        }

        if (state is ProfileLoaded && context.mounted) {
          if (state.profile.phoneNumber != null &&
              state.profile.gender != null &&
              state.profile.birthday != null &&
              state.profile.school != null &&
              state.profile.department != null) {
            if (shouldExecuteContinueRoute) {
              onContinueRoute();
            }
          }
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: onPressed,
          color: AppColors.kPrimary100,
          borderRadius: BorderRadius.circular(12.r),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            context.l10n.next,
            style: context.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
