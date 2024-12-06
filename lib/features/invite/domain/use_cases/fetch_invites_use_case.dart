import 'package:injectable/injectable.dart';
import 'package:unipool/features/invite/domain/repository/invites_repository.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';

@injectable
final class FetchInvitesUseCase {
  final InviteRepository repository;

  FetchInvitesUseCase({required this.repository});

  Future<List<InviteModel>> call(String userId) async {
    return repository.fetchInvites(userId);
  }
}
