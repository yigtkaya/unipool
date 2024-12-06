part of '../login_view.dart';

final class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool listenToAuthState;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.listenToAuthState = true,
  });

  @override
  Widget build(BuildContext context) {
    final Widget button = SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: onPressed,
        color: AppColors.kPrimary100,
        child: Text(
          text,
          style: context.textTheme.bodyLarge!.copyWith(
            color: AppColors.kWhite,
            fontSize: 18.sp,
          ),
        ),
      ),
    );

    if (!listenToAuthState) return button;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          CustomOverlayLoader.show(
            context,
            indicatorType: Indicator.ballRotate,
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
        if (state is AuthError) {
          CustomToastMessage.showCustomToast(
            context,
            state.failure.message,
            AppColors.kDanger400,
          );
        }
        if (state is AuthSuccess) {
          context.router.replace(
            RootRoute(
              userId: state.user.id,
            ),
          );
        }
      },
      builder: (context, state) => button,
    );
  }
}
