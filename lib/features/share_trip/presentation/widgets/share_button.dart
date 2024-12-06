part of '../share_trip_view.dart';

final class _ShareButton extends StatefulWidget {
  const _ShareButton();

  @override
  State<_ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<_ShareButton> with _ShareButtonMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // create a button with cupertino style
        CupertinoButton(
          color: AppColors.kPrimary100,
          padding: EdgeInsets.symmetric(
            vertical: AppDesignConstants.verticalPaddingMedium,
          ),
          onPressed: _handleShare,
          child: Text(
            context.l10n.createTrip,
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppColors.kWhite,
            ),
          ),
        ),
        SizedBox(
          height: AppDesignConstants.spacingMedium,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(
            context.l10n.close,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
