part of '../create_profile_view.dart';

final class ProfileForm extends StatefulWidget {
  final bool shouldExecuteContinueRoute;

  const ProfileForm({super.key, required this.shouldExecuteContinueRoute});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> with _ProfileFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePhotoPickContainer(
            onTap: pickProfileImage,
          ),
          SizedBox(
            height: AppDesignConstants.spacingLarge,
          ),
          PhoneNumberField(
            controller: phoneController,
            labelText: context.l10n.phoneNumber,
            onChanged: (phoneNumber) {
              context.read<PhoneCubit>().setPhoneNumber(phoneNumber.number, phoneNumber.countryCode);
            },
          ),
          SizedBox(height: AppDesignConstants.spacingMedium),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: nameController,
                  hintText: 'John',
                  labelText: context.l10n.name,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return context.l10n.thisFieldIsRequired;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: AppDesignConstants.spacingMedium),
              Expanded(
                child: CustomTextField(
                  controller: surnameController,
                  hintText: 'Doe',
                  labelText: context.l10n.surname,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return context.l10n.thisFieldIsRequired;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          BirthdayPicker(
            onBirthdayPressed: (DateTime? date) {
              onBirthdayPressed();
            },
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          const _GenderDropdown(),
          SizedBox(height: AppDesignConstants.spacingLarge),
          const SchoolPickerDropdown(),
          SizedBox(height: AppDesignConstants.spacingLarge),
          const DepartmentPickerDropdown(),
          SizedBox(height: AppDesignConstants.spacingLarge),
          LicensePlateField(
            controller: licensePlateController,
            onChanged: (value) {},
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
          ContinueButton(
            onPressed: onNextPressed,
            onContinueRoute: onContinueRoute,
            shouldExecuteContinueRoute: widget.shouldExecuteContinueRoute,
          ),
          SizedBox(height: AppDesignConstants.spacingLarge),
        ],
      ),
    );
  }
}
