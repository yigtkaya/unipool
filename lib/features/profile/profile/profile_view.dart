import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/app/shared/animations/fade_in_slide.dart';
import 'package:unipool/app/shared/icons/asset_icon.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/constants/asset_constants.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/permissions/bloc/permissions_bloc.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/localization/local_bloc/language_bloc.dart';

part 'widgets/profile_header.dart';
part 'widgets/cached_circle_avatar.dart';
part 'widgets/profile_app_bar.dart';
part 'widgets/ride_stats.dart';
part 'widgets/stats_item.dart';
part 'widgets/settings_list.dart';
part 'widgets/settings_group.dart';
part 'widgets/settings_item.dart';
part 'mixins/settings_mixin.dart';
part 'widgets/language_picker_sheet.dart';

@RoutePage()
final class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ProfileAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Profile section
              FadeInSlide(
                duration: 0.6,
                child: const _ProfileHeader(),
              ),
              const SizedBox(height: 24),
              // Stats section
              FadeInSlide(
                duration: 0.8,
                child: const RideStats(),
              ),
              const SizedBox(height: 24),
              // Wallet section
              FadeInSlide(
                duration: 1,
                child: const _SettingsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
