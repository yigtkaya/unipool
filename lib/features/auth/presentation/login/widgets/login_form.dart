part of '../login_view.dart';

final class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

final class _LoginFormState extends State<_LoginForm> with _LoginFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.email,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          EmailArea(
            controller: emailController,
            hint: 'name@example.com',
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          Text(
            context.l10n.password,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          PasswordArea(controller: passwordController),
          SizedBox(height: AppDesignConstants.spacing),
          _ForgotPasswordButton(),
          SizedBox(height: AppDesignConstants.spacingLarge * 2),
          // Login button
          AuthButton(text: context.l10n.logIn, onPressed: _onLoginButtonPressed),
        ],
      ),
    );
  }
}
