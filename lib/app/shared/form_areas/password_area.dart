import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';

final class PasswordArea extends StatefulWidget {
  const PasswordArea({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
  });
  final TextEditingController? controller;
  final Function(String text)? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  PasswordAreaState createState() => PasswordAreaState();
}

class PasswordAreaState extends State<PasswordArea> {
  late FocusNode myFocusNode;
  bool focused = false;
  bool hidden = true;

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
      keyboardType: TextInputType.text,
      obscureText: hidden,
      obscuringCharacter: '*',
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.toString().isEmpty) {
          return context.l10n.pleaseEnterPassword;
        } else if (value.toString().length < 8) {
          return context.l10n.aPasswordShouldBeAtLeast8Characters;
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintText: context.l10n.password,
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
        suffixIcon: IconButton(
          icon: Icon(
            hidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: AppColors.kSecondary400,
          ),
          onPressed: () => setState(() => hidden = !hidden),
        ),
      ),
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
