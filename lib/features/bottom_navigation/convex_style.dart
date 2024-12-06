import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class CustomBottomBarStyle extends StyleHook {
  @override
  double get activeIconSize => 32;

  @override
  double get activeIconMargin => 8;

  @override
  double get iconSize => 26;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
      fontSize: 12.sp,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
