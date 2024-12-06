part of '../create_profile_view.dart';

final class _Initializer extends StatelessWidget {
  final Widget child;
  const _Initializer({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<SchoolCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<DepartmentCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<BirthdayCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<GenderCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<ProfileImageCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<PhoneCubit>(
          create: (context) => getIt.call(),
        ),
      ],
      child: child,
    );
  }
}
