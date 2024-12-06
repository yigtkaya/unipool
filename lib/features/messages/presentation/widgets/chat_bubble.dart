import 'package:flutter/material.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/features/messages/domain/models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isCurrentUser;

  const ChatBubble({
    required this.message,
    required this.isCurrentUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingSmall,
          vertical: AppDesignConstants.verticalPaddingSmall,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingMedium,
        ),
        decoration: BoxDecoration(
          color: isCurrentUser ? AppColors.kPrimary100 : AppColors.kPrimary75,
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusLarge,
          ),
        ),
        child: Text(
          message.content,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
