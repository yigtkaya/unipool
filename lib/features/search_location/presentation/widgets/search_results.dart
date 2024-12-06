part of '../search_location_view.dart';

final class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchLocationBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const _SearchResultShimmer();
        }

        if (state is SearchSuccess) {
          final fromFocused = state.fromFocused;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.geoapifyPlaces.length,
            itemBuilder: (context, index) => _SearchResultItem(
              state.geoapifyPlaces[index],
              () {
                if (fromFocused) {
                  context.read<TripRouteCubit>().setFrom(state.geoapifyPlaces[index]);
                } else {
                  context.read<TripRouteCubit>().setTo(state.geoapifyPlaces[index]);
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
    );
  }
}

final class _SearchResultShimmer extends StatelessWidget {
  const _SearchResultShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [AppColors.kWhite, AppColors.kWhite, AppColors.kGreyLight2],
        stops: [0.1, 0.3, 0.5],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // Show 5 shimmer items
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Container(
              width: 40,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.kGrey,
                borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusSmall),
              ),
            ),
            subtitle: Container(
              width: 40,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.kGrey,
                borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusSmall),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _SearchResultItem extends StatelessWidget {
  final GeoapifyPlace place;
  final void Function() onTap;
  const _SearchResultItem(this.place, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        place.addressLine1 ?? '',
        style: context.textTheme.bodyLarge!.copyWith(
          color: AppColors.kBlack,
        ),
      ),
      subtitle: Text(
        place.formatted ?? '',
        style: context.textTheme.bodySmall,
      ),
      onTap: onTap,
    );
  }
}
