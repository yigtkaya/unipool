import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/features/landing/presentation/widgets/profile_photo.dart';
import 'package:unipool/features/comments/domain/models/comment_model.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

final class CommentItem extends StatelessWidget {
  final CommentModel comment;
  final ProfileModel profile;
  const CommentItem({
    super.key,
    required this.comment,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfilePhoto(
                  profilePhoto: profile.profilePhoto.toString(),
                ),
                Text(
                  "${profile.name} ${profile.surname}",
                  style: context.textTheme.bodyMedium,
                ),
                const Spacer(),
                Text(
                  comment.createdAt,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            Text(
              comment.comment,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

final class CommentItemShimmer extends StatelessWidget {
  const CommentItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: Card(
        color: Colors.white,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile photo shimmer
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Name shimmer
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Date shimmer
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 14,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Comment text shimmer
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 14,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
