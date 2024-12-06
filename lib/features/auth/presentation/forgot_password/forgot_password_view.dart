import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/app/shared/form_areas/email_area.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/auth/presentation/login/login_view.dart';

part 'mixins/forgot_password_mixin.dart';

@RoutePage()
final class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> with ForgotPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: BackButton(
          onPressed: () {
            context.router.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TitleSection(
                title: context.l10n.forgotPassword,
                subtitle: context.l10n.forgotPasswordDescription,
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              EmailArea(
                controller: emailController,
                hint: 'name@example.com',
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              const Spacer(),
              AuthButton(
                onPressed: _onSendButtonPressed,
                text: context.l10n.send,
                listenToAuthState: false,
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
