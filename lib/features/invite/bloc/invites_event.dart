part of 'invites_bloc.dart';

abstract class InvitesEvent {}

class LoadInvites extends InvitesEvent {
  final String tripId;

  LoadInvites({required this.tripId});
}

class SendInviteEvent extends InvitesEvent {
  final InviteModel invite;

  SendInviteEvent({required this.invite});
}

class DeleteInvite extends InvitesEvent {
  final InviteModel invite;

  DeleteInvite({required this.invite});
}

class ConfirmInvite extends InvitesEvent {
  final InviteModel invite;
  final String deletionId;

  ConfirmInvite({required this.invite, required this.deletionId});
}
