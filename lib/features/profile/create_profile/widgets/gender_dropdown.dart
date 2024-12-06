part of '../create_profile_view.dart';

final class _GenderDropdown extends StatelessWidget {
  const _GenderDropdown();

  @override
  Widget build(BuildContext context) {
    final list = <String>[
      context.l10n.male,
      context.l10n.female,
      context.l10n.other,
    ];

    return BlocBuilder<GenderCubit, String?>(
      builder: (context, state) {
        return CustomDropdownButton(
          bgColor: AppColors.kGreyLight1,
          buttonWidth: double.infinity,
          buttonPadding: EdgeInsets.symmetric(
            vertical: AppDesignConstants.verticalPaddingLarge,
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          buttonHeight: 64.h,
          hint: context.l10n.sex,
          valueAlignment: Alignment.centerLeft,
          value: toLocale(context, state),
          dropdownDecoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(8.r),
          ),
          dropdownItems: list,
          onChanged: (value) {
            if (value != null) {
              context.read<GenderCubit>().setGender(value);
            }
          },
        );
      },
    );
  }

  String? toLocale(BuildContext context, String? key) {
    switch (key) {
      case "Erkek":
      case "Male":
        return context.l10n.male;
      case "Kadın":
      case "Female":
        return context.l10n.female;
      case "Diğer":
      case "Other":
        return context.l10n.other;
      default:
        return null;
    }
  }
}
