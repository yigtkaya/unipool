part of '../reset_password_view.dart';

mixin _ResetPasswordFormMixin on State<_ResetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _onSendResetLinkPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // context.read<AuthBloc>().add(
    //       ResetPasswordEvent(emailController.text),
    //     );
  }
}
