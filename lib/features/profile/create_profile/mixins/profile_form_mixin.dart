part of '../create_profile_view.dart';

mixin _ProfileFormMixin on State<ProfileForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final licensePlateController = TextEditingController();
  late String userId;

  @override
  void initState() {
    super.initState();
    final profile = (context.read<ProfileBloc>().state as ProfileLoaded).profile;
    phoneController.text = profile.phoneNumber ?? "";
    surnameController.text = profile.surname ?? '';
    licensePlateController.text = profile.carPlate ?? '';
    nameController.text = profile.name ?? '';
    userId = profile.id!;
  }

  Future<void> onBirthdayPressed() async {
    final birthday = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1980),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      locale: context.read<LanguageBloc>().state.selectedLanguage.locale,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimary100, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.kPrimary100, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (birthday != null) {
      if (!mounted) return;
      context.read<BirthdayCubit>().setBirthday(birthday);
    }
  }

  Future<void> pickProfileImage() async {
    final source = await showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return const ImagePickerSource();
      },
    );
    if (source == null) return;

    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    if (!mounted) return;

    context.read<ProfileImageCubit>().selectImage(File(image.path));

    final selectedImage = context.read<ProfileImageCubit>().state;
    if (selectedImage.image == null) return;

    uploadProfileImage(selectedImage.image!, userId);
  }

  void uploadProfileImage(
    File image,
    String userId,
  ) {
    try {
      context.read<ProfileBloc>().add(
            UploadProfilePhotoEvent(image: image, userId: userId),
          );
    } catch (e) {
      CustomToastMessage.showCustomToast(
        context,
        e.toString(),
        AppColors.kDanger400,
      );
    }
  }

  void updateProfile(ProfileModel profile) {
    try {
      context.read<ProfileBloc>().add(UpdateProfileEvent(profile: profile));
    } catch (e) {
      CustomToastMessage.showCustomToast(
        context,
        e.toString(),
        AppColors.kDanger400,
      );
    }
  }

  Future<String?> getMessagingToken() async {
    return await MessagingHandler().getToken();
  }

  void onContinueRoute() {
    context.router.push(const StudentVerificationRoute());
  }

  Future<void> onNextPressed() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // check if gender, birthday, school and department are set
    if (context.read<GenderCubit>().state == null ||
        context.read<BirthdayCubit>().state == null ||
        context.read<SchoolCubit>().state == null ||
        context.read<ProfileImageCubit>().state.image == null ||
        context.read<DepartmentCubit>().state == null) {
      CustomToastMessage.showCustomToast(
        context,
        context.l10n.plaseFillInAllTheFields,
        AppColors.kDanger400,
      );
      return;
    }

    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
    final token = await getMessagingToken();

    if (!mounted) return;

    final phoneNumber = context.read<PhoneCubit>().state;
    final newUser = ProfileModel(
      id: userId,
      fcmToken: token,
      name: nameController.text,
      surname: surnameController.text,
      phoneNumber: phoneNumber.number,
      phoneCountryCode: phoneNumber.countryCode,
      gender: context.read<GenderCubit>().state,
      birthday: context.read<BirthdayCubit>().state?.toIso8601String(),
      school: context.read<SchoolCubit>().state,
      department: context.read<DepartmentCubit>().state,
      status: ProfileStatus.active,
      isVerified: false,
      carPlate: licensePlateController.text,
      profilePhoto: (context.read<ProfileBloc>().state as ProfileLoaded).profile.profilePhoto,
    );

    context.read<ProfileBloc>().add(UpdateProfileEvent(profile: newUser));
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
