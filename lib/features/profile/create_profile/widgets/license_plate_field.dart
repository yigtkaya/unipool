part of '../create_profile_view.dart';

final class LicensePlateField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const LicensePlateField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  static final RegExp _turkishPlateRegex = RegExp(
    r'^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.l10n.numberPlate,
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.kSecondary700,
              ),
            ),
            const Spacer(),
            Text(
              context.l10n.optional,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.kSecondary700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusSmall),
            border: Border.all(color: AppColors.kSecondary200),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.directions_car_outlined,
                  color: AppColors.kSecondary700,
                  size: 24,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  textCapitalization: TextCapitalization.characters,
                  style: context.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: '34 ABC 123',
                    hintStyle: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.kSecondary400,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onChanged: onChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null; // Field is optional
                    }
                    // Remove any extra spaces and convert to uppercase
                    final cleanValue = value.trim().toUpperCase();
                    if (!_turkishPlateRegex.hasMatch(cleanValue)) {
                      return context.l10n.notAvalidNumberPlate;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
