import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/app/shared/form_areas/custom_area.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/landing/presentation/widgets/profile_photo.dart';
import 'package:unipool/features/messages/bloc/chat_room_bloc.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/comments/bloc/comments_bloc.dart';
import 'package:unipool/features/profile/profile/profile_view.dart';
import 'package:unipool/features/comments/presentation/comment_item.dart';

part 'widgets/first_message_dialog.dart';

final class ProfileViewOthers extends StatelessWidget {
  final ProfileModel profile;
  const ProfileViewOthers({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentsBloc>(
      create: (context) => getIt.call()
        ..add(
          FetchComments(
            profile.id.toString(),
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: AppDesignConstants.horizontalPaddingSmall,
              ),
              child: IconButton(
                onPressed: () {
                  // show a dialog to ask user his first message to user
                  showDialog(
                    context: context,
                    builder: (context) => BlocProvider<ChatRoomBloc>(
                      create: (context) => getIt.call(),
                      child: FirstMessageDialog(profile: profile),
                    ),
                  );
                },
                icon: const Icon(
                  LucideIcons.message_circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: AppDesignConstants.horizontalPaddingMedium,
              ),
              child: IconButton(
                onPressed: () {
                  // create a room with the user and ask user to report this user
                },
                icon: const Icon(
                  LucideIcons.flag,
                  color: AppColors.kDanger400,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              ProfilePhoto(
                profilePhoto: profile.profilePhoto.toString(),
                size: 140,
              ),
              SizedBox(
                height: AppDesignConstants.spacing,
              ),
              Text(
                '${profile.name} ${profile.surname}',
                style: context.textTheme.titleSmall,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                profile.school.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
              Text(
                profile.department.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
              SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              const RideStats(),
              SizedBox(
                height: AppDesignConstants.spacingLarge * 2,
              ),
              BlocBuilder<CommentsBloc, CommentsState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n.comments,
                            style: context.textTheme.bodyLarge,
                          ),
                          GestureDetector(
                            onTap: state.isLoading
                                ? null
                                : () {
                                    // TODO
                                  },
                            child: Text(
                              context.l10n.seeAll,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDesignConstants.spacing,
                      ),
                      if (state.isLoading)
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  3,
                                  (index) => const CommentItemShimmer(),
                                ),
                              ),
                            ),
                          ],
                        )
                      else if (state.comments.isNotEmpty)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                state.comments.take(3).map((e) => CommentItem(comment: e, profile: profile)).toList(),
                          ),
                        )
                      else
                        Center(
                          child: Text(
                            context.l10n.noCommentsYet,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.kGrey,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
