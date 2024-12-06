import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';

@RoutePage()
final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckAuthStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.router.replace(
              RootRoute(
                userId: state.user.id,
              ),
            );
          }

          if (state is AuthLoading) {
            return;
          }

          if (state is AuthInitial) {
            context.router.replace(const LoginRoute());
          }

          if (state is AuthError) {
            context.router.replace(const LoginRoute());
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2E3192), // Deep Blue
                Color(0xFF1BFFFF), // Cyan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
