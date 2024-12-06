part of '../reset_password_view.dart';

final class FooterText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const FooterText({
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
