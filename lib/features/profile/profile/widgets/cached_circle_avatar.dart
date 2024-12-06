// create a widget that will cache the image and display it in a circle avatar u can use cached_network_image

part of '../profile_view.dart';

final class _CachedCircleAvatar extends StatelessWidget {
  final String imageUrl;
  const _CachedCircleAvatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroTags.profilePhoto,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 40.r,
        ),
        placeholder: (context, url) => Shimmer(
          gradient: LinearGradient(
            colors: [
              AppColors.kGrey,
              AppColors.kGreyLight1,
            ],
          ),
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.kGrey,
          ),
        ),
        errorWidget: (context, url, error) => const SizedBox.shrink(),
      ),
    );
  }
}

class HeroTags {
  static const String profilePhoto = 'profile-photo';
}
