part of '../my_trips_view.dart';

final class InviteListTile extends StatelessWidget {
  const InviteListTile({
    super.key,
    required this.invite,
    required this.trip,
  });

  final InviteModel invite;
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: AppDesignConstants.verticalPaddingSmall,
      ),
      leading: ProfilePhoto(
        profilePhoto: invite.inviter?.profilePhoto ?? '',
        size: 48.r,
      ),
      title: Text(
        '${invite.inviter?.name ?? ''} ${invite.inviter?.surname ?? ''}',
        style: context.textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis, // Add this line
      ),
      subtitle: Text(
        invite.inviter?.email ?? '',
        style: context.textTheme.bodySmall,
        overflow: TextOverflow.ellipsis, // Add this line
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              context.read<InvitesBloc>().add(
                    DeleteInvite(
                      invite: invite,
                    ),
                  );
            },
            child: Text(
              context.l10n.delete,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.kPrimary100,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimary100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusSmall,
                ),
              ),
            ),
            onPressed: () {
              final deletionId = trip.type == TripType.lookingDriver ? invite.inviteeTripId : invite.inviterTripId;
              context.read<InvitesBloc>().add(
                    ConfirmInvite(
                      invite: invite,
                      deletionId: deletionId.toString(),
                    ),
                  );
            },
            child: Text(
              context.l10n.accept,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
