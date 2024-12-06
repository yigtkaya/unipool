import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/app/text/custom_action_tag.dart';
import 'package:unipool/app/text/text_widget.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_constants.dart';

class PoliciesText extends StatelessWidget {
  const PoliciesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          context.l10n.clarificationText,
          customTag: {
            'ccLink': NoAttributesNoTextActionTag(
              () {
                showBarModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: HtmlWidget(
                      // the first parameter (`html`) is required
                      AppConstants.privacyPolicyHtml,

                      // all other parameters are optional, a few notable params:

                      // specify custom styling for an element
                      // see supported inline styling below
                      customStylesBuilder: (element) {
                        if (element.classes.contains('font-semibold')) {
                          return {'font-weight': 'bold'};
                        }

                        return null;
                      },

                      onLoadingBuilder: (context, element, attributes) => const Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(AppColors.kPrimary100),
                        ),
                      ),

                      // select the render mode for HTML body
                      // by default, a simple `Column` is rendered
                      // consider using `ListView` or `SliverList` for better performance
                      renderMode: RenderMode.listView,

                      // set the default styling for text
                      textStyle: context.textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
          },
          textAlign: TextAlign.start,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kBlack,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),
        ),
        TextWidget(
          context.l10n.termsOfUseText,
          customTag: {
            'ccLink': NoAttributesNoTextActionTag(
              () {
                showBarModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: HtmlWidget(
                      // the first parameter (`html`) is required
                      AppConstants.termsOfServiceHtml,

                      // all other parameters are optional, a few notable params:

                      // specify custom styling for an element
                      // see supported inline styling below
                      customStylesBuilder: (element) {
                        if (element.classes.contains('font-semibold')) {
                          return {'font-weight': 'bold'};
                        }

                        return null;
                      },
                      onLoadingBuilder: (context, element, attributes) => const Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(AppColors.kPrimary100),
                        ),
                      ),
                      // select the render mode for HTML body
                      // by default, a simple `Column` is rendered
                      // consider using `ListView` or `SliverList` for better performance
                      renderMode: RenderMode.listView,

                      // set the default styling for text
                      textStyle: context.textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
          },
          textAlign: TextAlign.start,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kBlack,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
