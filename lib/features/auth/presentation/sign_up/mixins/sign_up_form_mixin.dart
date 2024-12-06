part of '../sign_up_view.dart';

mixin _SignUpFormMixin on State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignUpButtonPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
          SignUpEvent(
            nameController.text,
            surnameController.text,
            emailController.text,
            passwordController.text,
          ),
        );
  }
}
