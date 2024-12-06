part of '../login_view.dart';

final class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSection({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        SizedBox(height: AppDesignConstants.spacing),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
      ],
    );
  }
}
