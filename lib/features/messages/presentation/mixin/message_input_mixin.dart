part of '../messages_view.dart';

mixin _MessageInputMixin on State<_MessageInputField> {
  final messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final profileId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
      context.read<ChatRoomBloc>().add(
            SendMessage(
              profileId: profileId,
              roomId: widget.roomId,
              content: messageController.text,
            ),
          );
      messageController.clear();
      context.read<MessageCubit>().clearMessage();
    }
  }
}
