part of '../sign_up_view.dart';

final class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

final class _SignUpFormState extends State<SignUpForm> with _SignUpFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            hintText: 'John',
            validator: (value) => value?.isEmpty == true ? context.l10n.thisFieldIsRequired : null,
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          CustomTextField(
            controller: surnameController,
            hintText: 'Doe',
            validator: (value) => value?.isEmpty == true ? context.l10n.thisFieldIsRequired : null,
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          EmailArea(
            controller: emailController,
            hint: 'name@example.com',
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          CustomTextField(
            controller: passwordController,
            hintText: '********',
            onChanged: (value) => setState(() {}),
          ),
          //         if (passwordController.text.isNotEmpty)
          // PasswordRequirements(password: passwordController.text, isVisible: passwordController.text.isNotEmpty),
          SizedBox(height: AppDesignConstants.spacingLarge),
          PoliciesText(),
          SizedBox(height: AppDesignConstants.spacingLarge * 2),
          AuthButton(
            text: context.l10n.signUp,
            onPressed: _onSignUpButtonPressed,
            listenToAuthState: false,
          ),
        ],
      ),
    );
  }
}
