part of 'invites_bloc.dart';

abstract class InvitesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InvitesInitial extends InvitesState {
  @override
  List<Object?> get props => [];
}

class InvitesLoading extends InvitesState {}

class InvitesLoaded extends InvitesState {
  final List<InviteModel> invites;

  InvitesLoaded({required this.invites});
}

class InvitesError extends InvitesState {
  final String message;

  InvitesError({required this.message});
}
