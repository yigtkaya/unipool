part of '../profile_view.dart';

final class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const _ProfileHeaderShimmer();
        }
        if (state is ProfileLoaded) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => context.router.push(
                  PhotoDetailRoute(
                    imageUrl: state.profile.profilePhoto ?? '',
                    heroTag: 'profile_photo',
                  ),
                ),
                child: _CachedCircleAvatar(imageUrl: state.profile.profilePhoto ?? ''),
              ),
              SizedBox(width: AppDesignConstants.spacingLarge),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${state.profile.name} ${state.profile.surname}",
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      state.profile.school ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

final class _ProfileHeaderShimmer extends StatelessWidget {
  const _ProfileHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [AppColors.kGrey, AppColors.kGreyLight1],
      ),
      child: Row(
        children: [
          _CachedCircleAvatar(imageUrl: ''),
          SizedBox(width: AppDesignConstants.spacingLarge),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'placeholder' * 2,
                  style: context.textTheme.bodyLarge,
                ),
                Text(
                  'placeholder' * 2,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.kGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
