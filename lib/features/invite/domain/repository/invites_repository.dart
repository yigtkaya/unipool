import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
part '../../data/invites_repository_impl.dart';

abstract class InviteRepository {
  Future<List<InviteModel>> fetchInvites(String userId);
  Future<String> deleteInvite(InviteModel invite);
  Future<String> confirmInvite(InviteModel invite, String deletionId);
  // Future<void> sendInvite(InviteModel invite);
}
