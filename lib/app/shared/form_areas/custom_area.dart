import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.inputType,
    this.labelText,
    this.prefixText,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.hasCurrencySymbol,
    this.enabled,
    this.suffixText,
    this.hintText,
    this.hasSearchIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
  });
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? labelText, prefixText, suffixText, hintText;
  final bool? hasCurrencySymbol;
  final int? maxLines, maxLength;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool? hasSearchIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;

  @override
  State<StatefulWidget> createState() => TextFieldState();
}

class TextFieldState extends State<CustomTextField> {
  late FocusNode myFocusNode;
  bool focused = false;
  bool isEmpty = true;

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
      autovalidateMode: AutovalidateMode.onUnfocus,
      readOnly: widget.readOnly ?? false,
      textInputAction: TextInputAction.next,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      cursorColor: AppColors.kPrimary100,
      enabled: widget.enabled,
      focusNode: myFocusNode,
      controller: widget.controller,
      keyboardType: widget.inputType,
      onChanged: (value) {
        setState(() => isEmpty = value.isEmpty);
        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        prefixIcon: widget.prefixIcon,
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
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
