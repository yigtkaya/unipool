part of '../create_profile_view.dart';

final class ProfilePhotoPickContainer extends StatelessWidget {
  final void Function() onTap;

  // Define a constant size for the avatar
  static const double _avatarSize = 160.0;

  const ProfilePhotoPickContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BlocBuilder<ProfileImageCubit, ProfileImageState>(
            builder: (context, state) {
              return Hero(
                tag: HeroTags.profilePhoto,
                child: Container(
                  width: _avatarSize.r,
                  height: _avatarSize.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: ClipOval(
                    child: _buildAvatarContent(state.image, state.imageUrl),
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.kPrimary100,
                child: Icon(
                  Icons.edit,
                  size: 18.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarContent(File? image, String? networkImageUrl) {
    // If network image URL is provided, show it
    if (networkImageUrl != null) {
      return CachedNetworkImage(
        imageUrl: networkImageUrl,
        fit: BoxFit.cover,
        width: _avatarSize.r,
        height: _avatarSize.r,
        placeholder: (context, url) => Center(
          child: SizedBox(
            width: 24.r,
            height: 24.r,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        errorWidget: (context, url, error) => _buildDefaultIcon(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    // Handle local image selection state
    return switch (image) {
      File() => Image.file(
          image,
          fit: BoxFit.cover,
          width: _avatarSize.r,
          height: _avatarSize.r,
          errorBuilder: (context, error, stackTrace) => _buildDefaultIcon(),
        ),
      _ => _buildDefaultIcon(),
    };
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Icon(
        LucideIcons.user,
        size: 64.r,
        color: AppColors.kSecondary400,
      ),
    );
  }
}
