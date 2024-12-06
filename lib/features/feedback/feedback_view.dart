import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
final class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        title: Text(
          "UniPool",
          style: context.textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDesignConstants.spacingLarge * 2,
            ),
            Text(
              context.l10n.yourOpinionMattersToUs,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
            SizedBox(
              height: AppDesignConstants.spacing,
            ),
            Text(
              context.l10n.weWouldLoveToHearFromYou,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: AppColors.kPrimary75,
                onPressed: () async {
                  // open mail app with feature request email
                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: 'info@unipool.app',
                    queryParameters: {
                      'subject': 'Feature Request',
                    },
                  );

                  await launchUrl(emailUri);
                },
                child: Text(
                  context.l10n.suggestAFeature,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingMedium,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: AppColors.kPurple,
                onPressed: () async {
                  // open mail app with feedback email
                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: 'info@unipool.app',
                    queryParameters: {
                      'subject': 'Bug Report',
                    },
                  );

                  await launchUrl(emailUri);
                },
                child: Text(
                  context.l10n.reportABug,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingMedium,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: AppColors.kSecondary700,
                onPressed: () async {
                  // open mail app with feedback email
                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: 'info@unipool.app',
                    queryParameters: {
                      'subject': 'Feedback',
                    },
                  );

                  await launchUrl(emailUri);
                },
                child: Text(
                  context.l10n.sendFeedback,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 2,
            ),
          ],
        ),
      ),
    );
  }
}
