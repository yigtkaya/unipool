import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/app/shared/animations/fade_in_slide.dart';
import 'package:unipool/app/shared/form_areas/custom_area.dart';
import 'package:unipool/app/shared/form_areas/email_area.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/auth/presentation/login/login_view.dart';
import 'package:unipool/features/auth/presentation/sign_up/widgets/policies_text.dart';

part 'widgets/sign_up_form.dart';
part 'mixins/sign_up_form_mixin.dart';

@RoutePage()
final class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDesignConstants.spacingLarge),
              // Title section
              FadeInSlide(
                duration: 0.6,
                child: TitleSection(
                  title: context.l10n.signUp,
                  subtitle: context.l10n.emailAndPassword,
                ),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              // Sign up form
              FadeInSlide(
                duration: 0.8,
                child: const SignUpForm(),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge * 2),
              // Footer text
              FadeInSlide(
                duration: 1,
                child: FooterText(
                  buttonText: context.l10n.logIn,
                  onPressed: context.router.back,
                  text: context.l10n.aldreadyHaveAnAccount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
