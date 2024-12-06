import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/app/shared/animations/fade_in_slide.dart';
import 'package:unipool/app/shared/form_areas/email_area.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/auth/presentation/login/login_view.dart';

part 'widgets/title_section.dart';
part 'widgets/reset_password_form.dart';
part 'mixins/reset_password_from_mixin.dart';
part 'widgets/footer_section.dart';

@RoutePage()
final class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        elevation: 0,
        leading: BackButton(
          onPressed: () => context.router.back(),
        ),
      ),
      body: Padding(
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
                title: context.l10n.resetPassword,
                subtitle: context.l10n.enterYourEmailToReset,
              ),
            ),
            SizedBox(height: AppDesignConstants.spacingLarge),
            // Form section
            FadeInSlide(
              duration: 0.8,
              child: const _ResetPasswordForm(),
            ),
            const Spacer(),
            // Footer text
            FadeInSlide(
              duration: 1,
              child: FooterText(
                text: context.l10n.rememberedYourPassword,
                buttonText: context.l10n.logIn,
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
