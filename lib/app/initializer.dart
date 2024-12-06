part of '../main.dart';

final class _Initializer extends StatelessWidget {
  final Widget child;
  const _Initializer({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<PermissionBloc>(
          create: (context) => getIt.call()
            ..add(
              CheckPermissionsEvent(),
            ),
        ),
        BlocProvider<MyTripsBloc>(
          create: (context) => getIt.call(),
        ),
      ],
      child: child,
    );
  }
}
