part of '../student_verification_view.dart';

final class _PDFUpload extends StatelessWidget {
  final VoidCallback onTap;
  const _PDFUpload({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentPdfCubit, File?>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: AppColors.kSecondary300,
                radius: Radius.circular(
                  AppDesignConstants.borderRadiusMedium,
                ),
                dashPattern: const [10, 5],
                padding: EdgeInsets.all(
                  AppDesignConstants.spacingLarge * 4,
                ),
                child: state == null
                    ? Image.asset(
                        AssetConstants.images.pdfUpload,
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                      )
                    : _SelectedPdfView(file: state),
              ),
              if (state != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () => context.read<StudentPdfCubit>().setPDF(null),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.kDanger400,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.kWhite,
                        size: 16.r,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SelectedPdfView extends StatelessWidget {
  final File file;

  const _SelectedPdfView({required this.file});

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.kPrimary7,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.picture_as_pdf,
              color: AppColors.kPrimary100,
              size: 40.r,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            file.path.split('/').last,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.kSecondary700,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            _formatFileSize(file.lengthSync()),
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.kSecondary500,
            ),
          ),
        ],
      ),
    );
  }
}
