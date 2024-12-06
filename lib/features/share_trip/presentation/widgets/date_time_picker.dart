part of '../share_trip_view.dart';

final class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripTimeCubit, DateTime?>(
      builder: (context, selectedDateTime) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.departureTime,
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(
              height: AppDesignConstants.spacing,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
                border: Border.all(color: AppColors.kGrey),
              ),
              child: ListTile(
                leading: const Icon(
                  LucideIcons.calendar_days,
                ),
                title: Text(
                  selectedDateTime?.formatAccordingToDifference() ?? "",
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDateTime ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: AppColors.kPrimary100,
                            onPrimary: Colors.white,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.kPrimary100,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    final time = selectedDateTime ?? DateTime.now();
                    if (context.mounted) {
                      context.read<TripTimeCubit>().setDate(
                            DateTime(
                              date.year,
                              date.month,
                              date.day,
                              time.hour,
                              time.minute,
                            ),
                          );
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                TimeContainerWithPicker(
                  selectedDateTime: selectedDateTime,
                  isHour: true,
                ),
                const SizedBox(width: 12),
                const Text(':'),
                const SizedBox(width: 12),
                TimeContainerWithPicker(
                  selectedDateTime: selectedDateTime,
                  isHour: false,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

final class TimeContainerWithPicker extends StatelessWidget {
  final DateTime? selectedDateTime;
  final bool isHour;
  const TimeContainerWithPicker({
    super.key,
    required this.selectedDateTime,
    required this.isHour,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(
              selectedDateTime ?? DateTime.now(),
            ),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: Colors.white,
                    hourMinuteTextColor: AppColors.kWhite,
                    hourMinuteTextStyle: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                    hourMinuteColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors.kPrimary100;
                      }
                      return AppColors.kGrey;
                    }),
                    helpTextStyle: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.kPrimary100,
                    ),
                    cancelButtonStyle: TextButton.styleFrom(
                      foregroundColor: AppColors.kBlack,
                    ),
                    dialHandColor: AppColors.kPrimary100,
                    dialBackgroundColor: AppColors.kPrimary100.withOpacity(0.1),
                    hourMinuteShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusMedium,
                      ),
                    ),
                    dayPeriodBorderSide: BorderSide(
                      color: AppColors.kPrimary100,
                    ),
                    dayPeriodColor: WidgetStateColor.resolveWith(
                      (states) => states.contains(WidgetState.selected) ? AppColors.kPrimary100 : Colors.transparent,
                    ),
                    dayPeriodTextColor: WidgetStateColor.resolveWith(
                      (states) => states.contains(WidgetState.selected) ? Colors.white : AppColors.kPrimary100,
                    ),
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (time != null) {
            final date = selectedDateTime ?? DateTime.now();
            if (context.mounted) {
              context.read<TripTimeCubit>().setDate(
                    DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    ),
                  );
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMedium),
            border: Border.all(color: AppColors.kGrey),
          ),
          child: Center(
            child: Text(
              isHour ? selectedDateTime?.hour.twoDigits() ?? "" : selectedDateTime?.minute.twoDigits() ?? "",
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
