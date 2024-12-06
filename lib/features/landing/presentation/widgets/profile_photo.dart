import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/router/app_router.dart';

final class ProfilePhoto extends StatelessWidget {
  final String profilePhoto;
  final double size;
  final bool enableTap;
  final String? heroTag;

  const ProfilePhoto({
    super.key,
    required this.profilePhoto,
    this.size = 72,
    this.enableTap = false,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final Widget photoWidget = CachedNetworkImage(
      imageUrl: profilePhoto,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.kGrey,
        highlightColor: AppColors.kGreyLight1,
        child: SizedBox(
          width: size,
          height: size,
          child: CircleAvatar(
            radius: size / 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.person,
        size: size,
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    if (!enableTap) {
      return photoWidget;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(size / 2),
      onTap: () => context.router.push(
        PhotoDetailRoute(
          imageUrl: profilePhoto,
          heroTag: heroTag ?? 'profile_photo',
        ),
      ),
      child: photoWidget,
    );
  }
}
