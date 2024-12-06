part of '../edit_profile_view.dart';

final class _Initializer extends StatelessWidget {
  final Widget child;

  const _Initializer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final profile = (context.read<ProfileBloc>().state as ProfileLoaded).profile;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileImageCubit>(
          create: (context) => getIt.call()..setImageUrl(profile.profilePhoto ?? ''),
        ),
        BlocProvider<PhoneCubit>(
          create: (context) => getIt.call()
            ..setPhoneNumber(
              profile.phoneCountryCode.toString(),
              profile.phoneNumber.toString(),
            ),
        ),
        BlocProvider<GenderCubit>(
          create: (context) => GenderCubit()..setGender(profile.gender.toString()),
        ),
        BlocProvider<BirthdayCubit>(
          create: (context) => getIt.call()
            ..setBirthday(
              DateTime.tryParse(
                profile.birthday.toString(),
              ),
            ),
        ),
        BlocProvider<SchoolCubit>(
          create: (context) => getIt.call()
            ..setSchool(
              profile.school.toString(),
            ),
        ),
        BlocProvider<DepartmentCubit>(
          create: (context) => getIt.call()
            ..setDepartment(
              profile.department.toString(),
            ),
        ),
      ],
      child: child,
    );
  }
}
