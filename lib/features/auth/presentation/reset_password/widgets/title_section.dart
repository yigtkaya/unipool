part of '../reset_password_view.dart';

final class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSection({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
