import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/constants/asset_constants.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/create_profile/cubit/student_pdf_cubit.dart';

part 'widgets/pdf_upload.dart';
part 'widgets/create_profile_button.dart';
part 'mixins/student_verification_mixin.dart';

@RoutePage()
final class StudentVerificationView extends StatelessWidget {
  const StudentVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentPdfCubit>(
      create: (context) => getIt.call(),
      child: const StudentVerificationBody(),
    );
  }
}

class StudentVerificationBody extends StatefulWidget {
  const StudentVerificationBody({super.key});

  @override
  State<StudentVerificationBody> createState() => _StudentVerificationBodyState();
}

class _StudentVerificationBodyState extends State<StudentVerificationBody> with _StudentVerificationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        title: Text(
          context.l10n.uploadStudentCertificate,
          style: context.textTheme.titleSmall,
        ),
        leading: BackButton(
          onPressed: () => context.router.back(),
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingLarge,
        ),
        child: _CreateProfileButton(
          onPressed: onUploadPDF,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDesignConstants.spacingLarge * 2),
              Text(
                context.l10n.uploadStudentCertificateDesc,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.kSecondary800,
                ),
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              _PDFUpload(
                onTap: onPickPdf,
              ),
              SizedBox(height: AppDesignConstants.spacingLarge),
              Text(
                context.l10n.incaseVerification,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.kSecondary800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
