part of '../login_view.dart';

mixin _LoginFormMixin on State<_LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
          LoginEvent(emailController.text, passwordController.text),
        );
  }
}
