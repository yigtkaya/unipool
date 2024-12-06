part of '../messages_view.dart';

final class _MessageInputField extends StatefulWidget {
  final String roomId;

  const _MessageInputField({required this.roomId});

  @override
  State<_MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<_MessageInputField> with _MessageInputMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDesignConstants.verticalPaddingSmall),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                keyboardType: TextInputType.text,
                autofocus: true,
                autocorrect: true,
                cursorColor: AppColors.kPrimary100,
                style: context.textTheme.bodyMedium,
                onChanged: (value) => context.read<MessageCubit>().setMessage(value),
                decoration: InputDecoration(
                  hintText: "${context.l10n.message}...",
                  hintStyle: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.kGrey,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDesignConstants.horizontalPaddingMedium,
                    vertical: AppDesignConstants.verticalPaddingSmall,
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => sendMessage(),
              ),
            ),
            SizedBox(
              width: AppDesignConstants.spacing,
            ),
            BlocListener<ChatRoomBloc, ChatRoomState>(
              listener: (context, state) {
                if (state is ChatRoomError) {
                  CustomToastMessage.showCustomToast(
                    context,
                    state.message,
                    AppColors.kDanger400,
                  );
                }
              },
              child: BlocBuilder<MessageCubit, String>(
                builder: (context, message) => InkWell(
                  onTap: sendMessage,
                  borderRadius: BorderRadius.circular(
                    AppDesignConstants.borderRadiusLarge,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: message.isEmpty ? AppColors.kGrey : AppColors.kPrimary100,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppDesignConstants.borderRadiusLarge,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(AppDesignConstants.spacing),
                    child: Icon(
                      LucideIcons.send,
                      color: message.isEmpty ? AppColors.kGreyLight1 : AppColors.kWhite,
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
