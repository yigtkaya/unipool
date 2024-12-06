import 'package:injectable/injectable.dart';
import 'package:unipool/features/invite/domain/repository/invites_repository.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';

@injectable
final class ConfirmInviteUseCase {
  final InviteRepository _inviteRepository;

  ConfirmInviteUseCase(this._inviteRepository);

  Future<String> call(InviteModel invite, String deletionId) async {
    return await _inviteRepository.confirmInvite(invite, deletionId);
  }
}
