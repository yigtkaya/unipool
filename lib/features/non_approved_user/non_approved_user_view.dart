import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';

@RoutePage()
final class NonApprovedUserView extends StatelessWidget {
  const NonApprovedUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded && state.profile.isVerified == true) {
          context.router.replaceAll([const BottomNavigationRoute()]);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.kPrimary100,
          title: Text(
            context.l10n.verificationPending,
            style: context.textTheme.titleSmall!.copyWith(
              color: AppColors.kWhite,
            ),
          ),
        ),
        body: RefreshIndicator(
          color: AppColors.kPrimary100,
          onRefresh: () async {
            final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
            context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    context.l10n.nonApprovedUserDesc,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.kSecondary400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
