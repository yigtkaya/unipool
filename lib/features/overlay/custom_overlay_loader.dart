import 'package:flutter/material.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';

final class CustomOverlayLoader extends StatelessWidget {
  final Indicator indicatorType;
  const CustomOverlayLoader({super.key, required this.indicatorType});

  static void show(BuildContext context, {required Indicator indicatorType}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CustomOverlayLoader(
        indicatorType: indicatorType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Transform.scale(
        scale: 0.3,
        child: LoadingIndicator(
          indicatorType: indicatorType,
          colors: [
            AppColors.kPrimary100,
            AppColors.kPrimary50,
            AppColors.kDanger400,
          ],
        ),
      ),
    );
  }
}
