import 'package:injectable/injectable.dart';
import 'package:unipool/features/invite/domain/repository/invites_repository.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';

@injectable
final class DeleteInviteUseCase {
  final InviteRepository _inviteRepository;

  DeleteInviteUseCase(this._inviteRepository);

  Future<String> call(InviteModel invite) async {
    return await _inviteRepository.deleteInvite(invite);
  }
}
