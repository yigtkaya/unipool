part of '../profile_view_others.dart';

class FirstMessageDialog extends StatefulWidget {
  final ProfileModel profile;
  const FirstMessageDialog({super.key, required this.profile});

  @override
  _FirstMessageDialogState createState() => _FirstMessageDialogState();
}

class _FirstMessageDialogState extends State<FirstMessageDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    textController.removeListener(_onTextChanged);
    textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppDesignConstants.horizontalPaddingMedium),
      surfaceTintColor: AppColors.kWhite,
      backgroundColor: AppColors.kWhite,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.sendFirstMessage,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            ProfilePhoto(
              profilePhoto: widget.profile.profilePhoto.toString(),
              size: 80,
            ),
            SizedBox(height: AppDesignConstants.spacing),
            Text(
              '${widget.profile.name} ${widget.profile.surname}',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.profile.school} - ${widget.profile.department}',
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: AppDesignConstants.spacingLarge * 2),
            CustomTextField(
              controller: textController,
              hintText: context.l10n.message,
              maxLines: 5,
            ),
            SizedBox(height: AppDesignConstants.spacingLarge * 2),
            BlocListener<ChatRoomBloc, ChatRoomState>(
              listener: (context, state) {
                if (state is ChatRoomLoading) {
                  CustomOverlayLoader.show(
                    context,
                    indicatorType: Indicator.ballClipRotatePulse,
                  );
                }

                if (state is ChatRoomListLoaded) {
                  Navigator.of(context, rootNavigator: true).pop();
                  CustomToastMessage.showCustomToast(
                    context,
                    context.l10n.messageSent,
                    AppColors.kSuccess400,
                  );
                  Navigator.of(context, rootNavigator: true).pop();
                } else {
                  if (state is ChatRoomError) {
                    CustomToastMessage.showCustomToast(
                      context,
                      state.message,
                      AppColors.kDanger400,
                    );
                    return;
                  }
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: textController.text.isEmpty ? AppColors.kGrey : AppColors.kPrimary100,
                  onPressed: textController.text.isEmpty
                      ? null
                      : () {
                          if (context.mounted) {
                            final currentUserId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
                            context.read<ChatRoomBloc>().add(
                                  CreateDirectMessageRoomSendMessage(
                                    currentUserId: currentUserId,
                                    otherUserId: widget.profile.id!,
                                    content: textController.text,
                                  ),
                                );
                          }
                        },
                  child: Text(
                    context.l10n.send,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
