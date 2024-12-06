part of '../my_trips_view.dart';

final class RemainingSeatsChip extends StatelessWidget {
  final int totalSeats;
  final int remainingSeats;
  const RemainingSeatsChip({
    super.key,
    required this.totalSeats,
    required this.remainingSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: AppColors.kPrimary7,
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMedium,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              totalSeats,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  index < (totalSeats - remainingSeats) ? Icons.person : Icons.person_outline,
                  size: 24,
                  color: index < (totalSeats - remainingSeats) ? AppColors.kPrimary100 : AppColors.kPrimary50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
