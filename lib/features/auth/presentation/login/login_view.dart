import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/app/shared/animations/fade_in_slide.dart';
import 'package:unipool/app/shared/form_areas/email_area.dart';
import 'package:unipool/app/shared/form_areas/password_area.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';

part 'widgets/logo_section.dart';
part 'widgets/title_section.dart';
part 'widgets/or_divider.dart';
part 'widgets/auth_button.dart';
part 'widgets/forgot_password_button.dart';
part 'widgets/social_button.dart';
part 'widgets/login_form.dart';
part 'mixins/login_form_mixin.dart';
part 'widgets/footer_text.dart';

@RoutePage()
final class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
            vertical: AppDesignConstants.verticalPaddingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo section
              FadeInSlide(
                duration: 0.4,
                child: const LogoSection(),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge * 3),
              // Title section
              FadeInSlide(
                duration: 0.6,
                child: TitleSection(
                  title: context.l10n.logIn,
                  subtitle: context.l10n.emailAndPassword,
                ),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              // Form section
              FadeInSlide(
                duration: 0.8,
                child: _LoginForm(),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              // Sign up section
              const Spacer(),
              // Footer text
              FadeInSlide(
                duration: 1,
                child: FooterText(
                  text: context.l10n.dontHaveAnAccount,
                  buttonText: context.l10n.signUp,
                  onPressed: () {
                    context.router.push(const SignUpRoute());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
