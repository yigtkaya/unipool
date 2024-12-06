part of '../create_profile_view.dart';

class ImagePickerSource extends StatelessWidget {
  const ImagePickerSource({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(context.l10n.pleaseChooseImageSource),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
          child: Text(
            context.l10n.gallery,
            style: context.textTheme.bodyMedium,
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, ImageSource.camera),
          child: Text(
            context.l10n.camera,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
