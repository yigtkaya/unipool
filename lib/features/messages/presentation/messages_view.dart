import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/messages/bloc/chat_room_bloc.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';
import 'package:unipool/features/messages/presentation/cubit/message_cubit.dart';
import 'package:unipool/features/messages/presentation/widgets/chat_bubble.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'widgets/messages_list_view.dart';
part 'widgets/message_input_field.dart';
part 'mixin/message_input_mixin.dart';

@RoutePage()
final class MessagesView extends StatelessWidget {
  final ProfileModel otherParticipant;
  final String roomId;

  const MessagesView({
    required this.otherParticipant,
    required this.roomId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatRoomBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<MessageCubit>(
          create: (context) => getIt.call(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite,
          scrolledUnderElevation: 1,
          leading: BackButton(
            onPressed: () => context.router.back(),
          ),
          title: Material(
            color: Colors.transparent,
            child: Hero(
              tag: otherParticipant.id ?? '',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: otherParticipant.profilePhoto != null
                        ? CachedNetworkImageProvider(otherParticipant.profilePhoto!)
                        : null,
                  ),
                  SizedBox(width: AppDesignConstants.spacing),
                  Flexible(
                    child: Text(
                      otherParticipant.name ?? '',
                      style: context.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            PullDownButton(
              position: PullDownMenuPosition.over,
              itemBuilder: (context) => [
                PullDownMenuItem(
                  onTap: () {
                    // TODO
                  },
                  title: context.l10n.report,
                  icon: LucideIcons.flag,
                  isDestructive: true,
                ),
                PullDownMenuItem(
                  onTap: () {
                    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id ?? '';
                    context.read<ChatRoomBloc>().add(
                          DeleteRoom(
                            roomId: roomId,
                            currentUserId: userId,
                          ),
                        );
                    context.router.back();
                  },
                  title: context.l10n.delete,
                  icon: LucideIcons.trash,
                ),
              ],
              buttonBuilder: (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(
                  LucideIcons.ellipsis_vertical,
                  size: 24,
                  color: AppColors.kBlack,
                ),
              ),
            ),
          ],
        ),
        body: MessagesBody(roomId: roomId),
      ),
    );
  }
}

final class MessagesBody extends StatefulWidget {
  final String roomId;

  const MessagesBody({
    required this.roomId,
    super.key,
  });

  @override
  State<MessagesBody> createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late String userId;

  @override
  void initState() {
    super.initState();
    context.read<ChatRoomBloc>().add(
          LoadMessages(
            widget.roomId,
          ),
        );
    userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id ?? '';
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<ChatRoomBloc, ChatRoomState>(
            listener: (context, state) {
              if (state is ChatRoomMessagesLoaded) {
                // Scroll to bottom when new messages arrive
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToBottom();
                });
              }
            },
            builder: (context, state) {
              if (state is ChatRoomLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.kPrimary100,
                    ),
                  ),
                );
              }
              if (state is ChatRoomError) {
                return Center(
                  child: Text(
                    state.message,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.kGrey,
                    ),
                  ),
                );
              }
              if (state is ChatRoomMessagesLoaded) {
                return _MessagesListView(
                  messages: state.messages,
                  scrollController: _scrollController,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        _MessageInputField(roomId: widget.roomId),
      ],
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
