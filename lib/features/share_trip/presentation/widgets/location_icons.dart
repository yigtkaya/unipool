part of '../share_trip_view.dart';

class _LocationIcons extends StatelessWidget {
  const _LocationIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: AppColors.kPrimary100,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: SizedBox(
              width: 12,
              height: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2, // Changed from width to height
            color: AppColors.kPrimary100,
          ),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.kPrimary100,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
