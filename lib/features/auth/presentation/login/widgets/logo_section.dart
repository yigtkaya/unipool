part of '../login_view.dart';

final class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusSmall,
          ),
          child: Image.asset(
            'assets/images/unipool_logo.png',
            height: 32,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'UniPool',
          style: context.textTheme.titleSmall!.copyWith(
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
