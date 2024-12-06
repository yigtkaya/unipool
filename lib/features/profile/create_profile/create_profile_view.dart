import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unipool/app/handlers/messaging_handler.dart';
import 'package:unipool/app/shared/button/dropdown_button.dart';
import 'package:unipool/app/shared/form_areas/custom_area.dart';
import 'package:unipool/app/shared/form_areas/phone_number_area.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/create_profile/cubit/birthday_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/department_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/gender_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/phone_number_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/profile_image_cubit.dart';
import 'package:unipool/features/profile/create_profile/cubit/school_cubit.dart';
import 'package:unipool/features/profile/create_profile/widgets/department_dropdown.dart';
import 'package:unipool/features/profile/create_profile/widgets/school_dropdown.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/profile/profile_view.dart';
import 'package:unipool/localization/local_bloc/language_bloc.dart';

part 'mixins/profile_form_mixin.dart';
part 'widgets/gender_dropdown.dart';
part 'widgets/profile_photo_pick_container.dart';
part 'widgets/birthday_picker.dart';
part 'widgets/continue_button.dart';
part 'widgets/profile_form.dart';
part 'widgets/image_picker_source.dart';
part 'widgets/initializer.dart';
part 'widgets/license_plate_field.dart';

@RoutePage()
class CreateProfileView extends StatelessWidget {
  const CreateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        title: Text(
          context.l10n.createProfile,
          style: context.textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
            vertical: AppDesignConstants.verticalPaddingMedium,
          ),
          child: _Initializer(
            child: const ProfileForm(shouldExecuteContinueRoute: true),
          ),
        ),
      ),
    );
  }
}
