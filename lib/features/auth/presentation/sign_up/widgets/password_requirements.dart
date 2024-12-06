import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';

class PasswordRequirements extends StatelessWidget {
  final String password;
  final bool isVisible;

  const PasswordRequirements({
    super.key,
    required this.password,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 400),
      offset: isVisible ? Offset.zero : const Offset(0, -0.1),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isVisible ? 1.0 : 0.0,
        child: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.kGreyLight2,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.kGrey,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password must contain:',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.kSecondary400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                RequirementItem(
                  isValid: password.length >= 8,
                  text: 'At least 8 characters',
                ),
                SizedBox(height: 4.h),
                RequirementItem(
                  isValid: password.contains(RegExp(r'[A-Z]')),
                  text: 'One uppercase letter',
                ),
                SizedBox(height: 4.h),
                RequirementItem(
                  isValid: password.contains(RegExp(r'[a-z]')),
                  text: 'One lowercase letter',
                ),
                SizedBox(height: 4.h),
                RequirementItem(
                  isValid: password.contains(RegExp(r'[0-9]')),
                  text: 'One number',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequirementItem extends StatelessWidget {
  final bool isValid;
  final String text;

  const RequirementItem({
    super.key,
    required this.isValid,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isValid ? Icons.check_circle_rounded : Icons.circle_outlined,
            size: 16.r,
            color: isValid ? AppColors.kSuccess400 : AppColors.kSecondary300,
            key: ValueKey(isValid),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: isValid ? AppColors.kSuccess400 : AppColors.kSecondary400,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
