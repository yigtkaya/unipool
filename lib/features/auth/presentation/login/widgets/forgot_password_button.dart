part of '../login_view.dart';

final class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          context.router.push(const ForgotPasswordRoute());
        },
        child: Text(
          context.l10n.forgotPassword,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kPrimary100,
          ),
        ),
      ),
    );
  }
}
