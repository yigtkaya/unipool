part of '../chat_rooms_view.dart';

final class ChatRoomTile extends StatelessWidget {
  final Room room;
  final String currentProfileId;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ChatRoomTile({
    required this.room,
    required this.currentProfileId,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete();
            },
            backgroundColor: AppColors.kDanger400,
            foregroundColor: AppColors.kWhite,
            icon: Icons.delete,
            label: context.l10n.delete,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: _buildAvatar(),
        title: _buildTitle(context),
        subtitle: _buildLastMessage(context),
        trailing: Text(
          room.lastMessage?.createdAt.formattedDateTimeForChatListItem() ?? '',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildLastMessage(BuildContext context) {
    final lastMessage = room.lastMessage;
    if (lastMessage == null) {
      return Text(
        context.l10n.noMessages,
        style: context.textTheme.bodySmall!.copyWith(
          color: AppColors.kGrey,
        ),
      );
    }

    final isCurrentUser = lastMessage.profileId == currentProfileId;
    return Text(
      '${isCurrentUser ? 'You: ' : ''}${lastMessage.content}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final otherParticipant = room.otherParticipant;
    return Text(
      '${otherParticipant?.name} ${otherParticipant!.surname!.substring(0, 1)}.',
      style: context.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAvatar() {
    final otherParticipant = room.otherParticipant;
    final heroTag = otherParticipant?.id ?? UniqueKey().toString();

    return Hero(
      tag: heroTag,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.kGrey,
        child: ProfilePhoto(
          profilePhoto: otherParticipant?.profilePhoto ?? '',
        ),
      ),
    );
  }
}

final class ChatRoomTileShimmer extends StatelessWidget {
  const ChatRoomTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kGrey,
      highlightColor: AppColors.kGreyLight1,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 34,
        ),
        title: Container(
          width: 140,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        subtitle: Container(
          width: 200,
          height: 14,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        trailing: Container(
          width: 40,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
