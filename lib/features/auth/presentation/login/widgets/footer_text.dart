part of '../login_view.dart';

final class FooterText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String buttonText;
  const FooterText({super.key, required this.onPressed, required this.text, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kSecondary400,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              buttonText,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.kPrimary100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
