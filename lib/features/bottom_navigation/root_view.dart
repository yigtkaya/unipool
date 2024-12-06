import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unipool/app/shared/icons/asset_icon.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/constants/asset_constants.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/bottom_navigation/convex_style.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/permissions/bloc/permissions_bloc.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/share_trip/presentation/share_trip_view.dart';

part 'convex_bottom_bar.dart';

@RoutePage()
final class RootView extends StatefulWidget {
  final String userId;
  const RootView({super.key, required this.userId});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileEvent(id: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const CustomOverlayLoader(indicatorType: Indicator.ballRotate);
        }
        if (state is ProfileLoaded) {
          if (state.profile.phoneNumber == null && state.profile.studentDocument == null) {
            context.router.replaceAll([const CreateProfileRoute()]);
            return const CustomOverlayLoader(indicatorType: Indicator.ballRotate);
          }
          if (state.profile.phoneNumber != null && state.profile.studentDocument == null) {
            context.router.replaceAll([const StudentVerificationRoute()]);
            return const CustomOverlayLoader(indicatorType: Indicator.ballRotate);
          }
          if (state.profile.isVerified == false) {
            context.router.replaceAll([const NonApprovedUserRoute()]);
            return const CustomOverlayLoader(indicatorType: Indicator.ballRotate);
          }
          return const BottomNavigationView();
        }
        if (state is ProfileError) {
          context.router.replaceAll([const CreateProfileRoute()]);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

@RoutePage()
final class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PermissionBloc>().add(
          RequestAllPermissionsEvent(),
        );
    return AutoTabsScaffold(
      routes: [
        LandingPageRoute(),
        ChatRoomRoute(),
        ShareTripRoute(),
        MyTripsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return StyleProvider(
          style: CustomBottomBarStyle(),
          child: CustomConvexBottomBar(
            tabsRouter: tabsRouter,
          ),
        );
      },
    );
  }
}
