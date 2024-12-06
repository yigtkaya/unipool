part of '../forgot_password_view.dart';

mixin ForgotPasswordMixin on State<ForgotPasswordView> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _onSendButtonPressed() {
    if (emailController.text.isEmpty) {
      CustomToastMessage.showCustomToast(context, context.l10n.pleaseEnterEmail, AppColors.kDanger400);
      return;
    }

    context.read<AuthBloc>().add(
          ForgotPasswordEvent(
            emailController.text,
          ),
        );

    emailController.clear();
  }
}
