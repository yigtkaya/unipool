part of '../student_verification_view.dart';

final class _CreateProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _CreateProfileButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          CustomOverlayLoader.show(
            context,
            indicatorType: Indicator.ballClipRotatePulse,
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
        if (state is ProfileError) {
          CustomToastMessage.showCustomToast(
            context,
            state.message,
            AppColors.kDanger400,
          );
        }
        if (state is ProfileLoaded) {
          if (state.profile.isVerified == false) {
            context.router.replaceAll([const NonApprovedUserRoute()]);
          } else {
            context.router.replaceAll([const BottomNavigationRoute()]);
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
