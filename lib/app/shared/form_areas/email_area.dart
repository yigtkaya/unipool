import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_constants.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';

final class EmailArea extends StatefulWidget {
  final String? hint;
  final Function(String)? onChanged;
  final TextEditingController controller;

  const EmailArea({
    super.key,
    required this.controller,
    this.onChanged,
    this.hint,
  });

  @override
  State<EmailArea> createState() => _EmailAreaState();
}

class _EmailAreaState extends State<EmailArea> {
  late FocusNode myFocusNode;
  bool focused = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode()..addListener(() => setState(() => focused = myFocusNode.hasFocus));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.kPrimary100,
      showCursor: true,
      maxLines: 1,
      focusNode: myFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.toString().isEmpty) {
          return context.l10n.pleaseEnterEmail;
        } else if (!RegExp(AppConstants.emailRegex).hasMatch(value)) {
          return context.l10n.pleaseEnterValidEmail;
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintText: widget.hint ?? 'Email',
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.kDanger500,
        ),
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kSecondary400,
          fontSize: 14.sp,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        errorBorder: _buildBorder(color: AppColors.kDanger500),
        disabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(color: AppColors.kDanger500),
      ),
      enableSuggestions: true,
      autofillHints: const [
        AutofillHints.email,
      ],
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
