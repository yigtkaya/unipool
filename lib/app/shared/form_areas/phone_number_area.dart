import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/localization/local_bloc/language_bloc.dart';

final class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
    this.labelText,
  });
  final TextEditingController? controller;
  final ValueChanged<PhoneNumber>? onChanged;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final String? labelText;

  @override
  State<StatefulWidget> createState() => PhoneNumberFieldState();
}

class PhoneNumberFieldState extends State<PhoneNumberField> {
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
    return IntlPhoneField(
      controller: widget.controller,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: AppColors.kWhite,
        countryCodeStyle: context.textTheme.bodyLarge,
        countryNameStyle: context.textTheme.bodyMedium,
      ),
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.kSecondary400,
      ),
      validator: (value) {
        if (value?.completeNumber.isEmpty ?? true) {
          return context.l10n.thisFieldIsRequired;
        }
        return null;
      },
      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 7.w),
      focusNode: widget.focusNode ?? myFocusNode,
      onSubmitted: widget.onFieldSubmitted,
      showCountryFlag: true,
      onChanged: widget.onChanged,
      languageCode: context.read<LanguageBloc>().state.selectedLanguage.locale.languageCode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        labelStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kSecondary400,
          fontSize: 14.sp,
        ),
        labelText: widget.labelText,
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.kDanger500,
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
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autovalidateMode: AutovalidateMode.onUnfocus,
      invalidNumberMessage:
          widget.controller?.text == '' ? context.l10n.thisFieldIsRequired : context.l10n.validatorPhoneError,
      initialCountryCode: 'TR',
      cursorColor: AppColors.kPrimary100,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
