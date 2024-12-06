part of '../search_location_view.dart';

final class _SearchContainer extends StatefulWidget {
  const _SearchContainer();

  @override
  State<_SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<_SearchContainer> with _SearchFieldsMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TripRouteCubit, TripRouteState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusMedium,
                ),
              ),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "${context.l10n.from}?",
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: state.from == null ? null : AppColors.kPrimary100,
                    ),
                    controller: fromController,
                    onChanged: (value) => debounceSearch(value, true),
                    suffixIcon: GestureDetector(
                      onTap: () => context.read<TripRouteCubit>().swapFromTo(),
                      child: const Icon(LucideIcons.arrow_up_down),
                    ),
                  ),
                  SizedBox(
                    height: AppDesignConstants.spacingMedium,
                  ),
                  CustomTextField(
                    hintText: "${context.l10n.whereTo}?",
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: state.to == null ? null : AppColors.kPrimary100,
                    ),
                    controller: toController,
                    onChanged: (value) => debounceSearch(value, false),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: AppDesignConstants.spacingMedium),
        BlocBuilder<SearchLocationBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const _SearchResultShimmer();
            }

            if (state is SearchSuccess) {
              if (state.geoapifyPlaces.isEmpty) {
                return Center(
                  child: Text(
                    'No results found',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.kGrey,
                    ),
                  ),
                );
              }

              final fromFocused = state.fromFocused;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.geoapifyPlaces.length,
                itemBuilder: (context, index) => _SearchResultItem(
                  state.geoapifyPlaces[index],
                  () {
                    if (fromFocused) {
                      context.read<TripRouteCubit>().setFrom(state.geoapifyPlaces[index]);
                      fromController.text = state.geoapifyPlaces[index].addressLine1 ?? '';
                    } else {
                      context.read<TripRouteCubit>().setTo(state.geoapifyPlaces[index]);
                      toController.text = state.geoapifyPlaces[index].addressLine1 ?? '';
                    }
                  },
                ),
              );
            }

            if (state is SearchFailure) {
              return Center(
                child: Text(
                  l10n.somethingWentWrong,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.kGrey,
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
