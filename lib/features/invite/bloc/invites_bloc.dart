import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/invite/domain/use_cases/confirm_invite_use_case.dart';
import 'package:unipool/features/invite/domain/use_cases/delete_invite_use_case.dart';
import 'package:unipool/features/invite/domain/use_cases/fetch_invites_use_case.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';

part 'invites_event.dart';
part 'invites_state.dart';

@injectable
final class InvitesBloc extends Bloc<InvitesEvent, InvitesState> {
  final FetchInvitesUseCase fetchInvites;
  final DeleteInviteUseCase deleteInvite;
  final ConfirmInviteUseCase confirmInvite;

  InvitesBloc({
    required this.fetchInvites,
    required this.deleteInvite,
    required this.confirmInvite,
  }) : super(InvitesInitial()) {
    on<LoadInvites>(_loadInvites);
    on<DeleteInvite>(_deleteInvite);
    on<ConfirmInvite>(_confirmInvite);
  }

  Future<void> _loadInvites(LoadInvites event, Emitter<InvitesState> emit) async {
    emit(InvitesLoading());
    try {
      final invites = await fetchInvites.call(event.tripId);
      emit(InvitesLoaded(invites: invites));
    } catch (e) {
      emit(InvitesError(message: e.toString()));
    }
  }

  Future<void> _deleteInvite(DeleteInvite event, Emitter<InvitesState> emit) async {
    emit(InvitesLoading());
    final response = await deleteInvite.call(event.invite);

    if (response == "OK") {
      add(
        LoadInvites(
          tripId: event.invite.inviteeTripId!,
        ),
      );
    } else {
      emit(InvitesError(message: response));
    }
  }

  Future<void> _confirmInvite(ConfirmInvite event, Emitter<InvitesState> emit) async {
    emit(InvitesLoading());
    final response = await confirmInvite.call(event.invite, event.deletionId);

    if (response == "OK") {
      add(
        LoadInvites(
          tripId: event.invite.inviteeTripId!,
        ),
      );
    } else {
      emit(InvitesError(message: response));
    }
  }
}
