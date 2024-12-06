part of '../share_trip_view.dart';

class _TripRouteSelection extends StatelessWidget {
  const _TripRouteSelection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.tripRoute,
          style: context.textTheme.bodyLarge,
        ),
        Text(
          context.l10n.pleaseEnterFromTo,
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppDesignConstants.spacing,
        ),
        BlocBuilder<TripRouteCubit, TripRouteState>(
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusMedium,
              ),
              onTap: () {
                context.router.push(
                  SearchLocationRoute(
                    tripRouteCubit: context.read<TripRouteCubit>(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDesignConstants.borderRadiusMedium,
                  ),
                  border: Border.all(
                    color: AppColors.kGrey,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: state.from == null ? null : AppColors.kPrimary100,
                      ),
                      title: Text(
                        state.from == null ? "${context.l10n.whereTo}?" : state.from!.addressLine1!,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: state.to == null
                          ? null
                          : GestureDetector(
                              onTap: () {
                                context.read<TripRouteCubit>().swapFromTo();
                              },
                              child: const Icon(LucideIcons.arrow_up_down),
                            ),
                    ),
                    if (state.to != null) ...[
                      const Divider(
                        height: 1,
                        color: AppColors.kGrey,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: state.to == null ? null : AppColors.kPrimary100,
                        ),
                        title: Text(
                          state.to!.addressLine1!,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
