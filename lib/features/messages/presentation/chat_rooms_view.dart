import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/date_time_extensions.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/landing/presentation/widgets/profile_photo.dart';
import 'package:unipool/features/messages/bloc/chat_room_bloc.dart';
import 'package:unipool/features/messages/domain/models/room_model.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'widgets/chat_room_tile.dart';

@RoutePage()
final class ChatRoomView extends StatelessWidget {
  const ChatRoomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id ?? '';
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatRoomBloc>(
          create: (context) => getIt.call()
            ..add(
              LoadUserRooms(userId),
            ),
          lazy: false,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.messages,
            style: context.textTheme.titleSmall,
          ),
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite,
        ),
        body: const RoomsListView(),
      ),
    );
  }
}

final class RoomsListView extends StatelessWidget {
  const RoomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.kPrimary100,
      backgroundColor: AppColors.kWhite,
      onRefresh: () async {
        final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id ?? '';
        context.read<ChatRoomBloc>().add(LoadUserRooms(userId));
      },
      child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        builder: (context, state) {
          if (state is ChatRoomLoading) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return const ChatRoomTileShimmer();
              },
              separatorBuilder: (context, index) => SizedBox(
                height: AppDesignConstants.spacingMedium,
              ),
              itemCount: 10,
            );
          }

          if (state is ChatRoomError) {
            return LayoutBuilder(
              builder: (context, constraints) => ListView(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.horizontalPaddingMedium,
                    ),
                    child: Center(
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is ChatRoomListLoaded) {
            final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id ?? '';

            return state.rooms.isEmpty
                ? LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDesignConstants.horizontalPaddingMedium,
                          ),
                          child: Center(
                            child: Text(
                              context.l10n.noMessages,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColors.kGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: state.rooms.length,
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDesignConstants.horizontalPaddingMedium,
                        vertical: AppDesignConstants.spacing,
                      ),
                      child: const Divider(
                        height: 1,
                        color: AppColors.kGreyLight2,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      final room = state.rooms[index];
                      return ChatRoomTile(
                        room: room,
                        currentProfileId: userId,
                        onTap: () {
                          context.router.push(
                            MessagesRoute(
                              otherParticipant: room.otherParticipant ?? ProfileModel(),
                              roomId: room.id,
                            ),
                          );
                        },
                        onDelete: () async {
                          // show dialog to ask user to confirm deletion
                          final response = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Delete Chat Room'),
                              content: Text('Are you sure you want to delete this chat room?'),
                              actions: [
                                TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel')),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          );

                          if (response == true) {
                            if (context.mounted) {
                              context.read<ChatRoomBloc>().add(
                                    DeleteRoom(
                                      roomId: room.id,
                                      currentUserId: userId,
                                    ),
                                  );
                            }
                          }
                        },
                      );
                    },
                  );
          }

          return ListView(children: const [SizedBox.shrink()]);
        },
      ),
    );
  }
}
