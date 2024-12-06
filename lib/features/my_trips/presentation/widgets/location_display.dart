part of '../my_trips_view.dart';

class LocationDisplay extends StatelessWidget {
  final String pickupAddress;
  final String dropoffAddress;
  final bool isDropoffOptional;

  const LocationDisplay({
    super.key,
    required this.pickupAddress,
    required this.dropoffAddress,
    this.isDropoffOptional = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Vertical line with circles
          Column(
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
                  width: 2,
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
          ),
          const SizedBox(width: 16),
          // Address information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.from,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      pickupAddress,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${l10n.to} ${isDropoffOptional ? '(${l10n.optional})' : ''}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGrey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dropoffAddress,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
