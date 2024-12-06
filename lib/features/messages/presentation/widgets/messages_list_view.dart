part of '../messages_view.dart';

final class _MessagesListView extends StatelessWidget {
  final ScrollController scrollController;
  final Stream<List<Message>> messages;

  const _MessagesListView({
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      builder: (context, state) {
        if (state is ChatRoomMessagesLoaded) {
          return StreamBuilder<List<Message>>(
            stream: messages,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(AppColors.kPrimary100),
                  ),
                );
              }
              if (snapshot.hasData) {
                final messages = snapshot.data ?? [];
                return ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ChatBubble(
                      message: message,
                      isCurrentUser: message.profileId == userId,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
