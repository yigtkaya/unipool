part of '../reset_password_view.dart';

final class _ResetPasswordForm extends StatefulWidget {
  const _ResetPasswordForm();

  @override
  State<_ResetPasswordForm> createState() => _ResetPasswordFormState();
}

final class _ResetPasswordFormState extends State<_ResetPasswordForm> with _ResetPasswordFormMixin {
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          EmailArea(
            controller: emailController,
            hint: context.l10n.email,
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          AuthButton(
            text: context.l10n.send,
            onPressed: _onSendResetLinkPressed,
          ),
        ],
      ),
    );
  }
}
