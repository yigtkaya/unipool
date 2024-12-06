import 'package:flutter/material.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';

final class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  const StickyHeaderDelegate({
    required this.title,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor ?? AppColors.kWhite,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingMedium,
        vertical: AppDesignConstants.verticalPaddingSmall,
      ),
      child: Text(
        title,
        style: context.textTheme.titleSmall,
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) {
    return title != oldDelegate.title ||
        backgroundColor != oldDelegate.backgroundColor ||
        textColor != oldDelegate.textColor;
  }
}
