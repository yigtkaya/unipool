part of '../create_profile_view.dart';

final class BirthdayPicker extends StatelessWidget {
  final void Function(DateTime?) onBirthdayPressed;
  const BirthdayPicker({super.key, required this.onBirthdayPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthdayCubit, DateTime?>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 64.h,
          child: CupertinoButton(
            color: AppColors.kGreyLight1,
            onPressed: () => onBirthdayPressed(state),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              state == null ? "--/--/---" : "${state.day}/${state.month}/${state.year}",
              style: context.textTheme.bodyLarge!.copyWith(
                color: state == null ? AppColors.kGrey : AppColors.kBlack,
                fontSize: 14.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
