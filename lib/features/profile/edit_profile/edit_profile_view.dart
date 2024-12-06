import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/create_profile/create_profile_view.dart';
import 'package:unipool/features/profile/create_profile/cubit/birthday_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/department_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/gender_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/phone_number_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/profile_image_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/school_cubit.dart';

part 'widgets/initializer.dart';

@RoutePage()
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        title: Text(
          context.l10n.editProfile,
          style: context.textTheme.titleSmall,
        ),
        leading: BackButton(
          onPressed: () => context.router.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingMedium,
        ),
        child: _Initializer(
          child: const ProfileForm(shouldExecuteContinueRoute: false),
        ),
      ),
    );
  }
}
