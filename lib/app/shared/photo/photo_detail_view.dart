import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/core/constants/app_colors.dart';

@RoutePage()
class PhotoDetailView extends StatefulWidget {
  final String imageUrl;
  final String heroTag;

  const PhotoDetailView({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  State<PhotoDetailView> createState() => _PhotoDetailViewState();
}

class _PhotoDetailViewState extends State<PhotoDetailView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.reverse().then((_) => context.router.back());
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: Center(
          child: Hero(
            tag: widget.heroTag,
            flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
            ) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Tween<double>(
                        begin: 36.r,
                        end: 0,
                      ).animate(animation).value,
                    ),
                    child: child,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(AppColors.kPrimary100),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Tween<double>(
                        begin: 36.r,
                        end: 0,
                      ).animate(_animation).value,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
