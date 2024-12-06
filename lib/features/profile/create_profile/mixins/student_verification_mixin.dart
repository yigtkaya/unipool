part of '../student_verification_view.dart';

mixin _StudentVerificationMixin on State<StudentVerificationBody> {
  Future<void> onPickPdf() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (file != null) {
      if (!mounted) return;
      context.read<StudentPdfCubit>().setPDF(File(file.files.first.path!));
    }
  }

  void onUploadPDF() {
    final pdf = context.read<StudentPdfCubit>().state;

    if (pdf == null) {
      CustomToastMessage.showCustomToast(
        context,
        context.l10n.pleaseUploadStudentCertificate,
        AppColors.kDanger400,
      );
      return;
    }

    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;

    context.read<ProfileBloc>().add(
          UploadStudentPdfEvent(
            pdf: pdf,
            userId: userId,
          ),
        );
  }
}
