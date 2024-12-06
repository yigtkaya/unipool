import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';

final class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    required this.bgColor,
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.dropdownSearchData,
    this.offset = Offset.zero,
    super.key,
  });
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final Color bgColor;
  final DropdownSearchData<String>? dropdownSearchData;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        //To avoid long text overflowing.
        dropdownSearchData: dropdownSearchData,
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  alignment: valueAlignment,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: (context) {
          return dropdownItems.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  value ?? item,
                  style: TextStyle(
                    color: AppColors.kBlack,
                    fontSize: 15.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40,
          width: buttonWidth ?? 140,
          padding: buttonPadding ?? EdgeInsets.symmetric(horizontal: 14.w),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: bgColor,
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          iconSize: iconSize ?? 24.h,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? 200,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14.r),
                  bottomRight: Radius.circular(14.r),
                ),
              ),
          elevation: dropdownElevation ?? 8,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? Radius.circular(40.r),
            thickness: scrollbarThickness != null ? WidgetStateProperty.all<double>(scrollbarThickness!) : null,
            thumbVisibility: scrollbarAlwaysShow != null ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!) : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40.h,
          padding: itemPadding ??
              EdgeInsets.symmetric(
                horizontal: 14.w,
              ),
        ),
      ),
    );
  }
}
