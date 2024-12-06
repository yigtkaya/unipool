part of '../domain/repository/invites_repository.dart';

@Injectable(as: InviteRepository)
class InviteRepositoryImpl implements InviteRepository {
  final supabase = Supabase.instance.client;
  @override
  Future<List<InviteModel>> fetchInvites(String tripId) async {
    try {
      final response = await supabase.from('invites').select('''
            *,
            inviter:profiles!inviter_id(*)
          ''').eq('invitee_trip_id', tripId);

      return response.map((invite) => InviteModelMapper.fromMap(invite)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<String> confirmInvite(InviteModel invite, String deletionId) async {
    try {
      final response = await supabase.rpc(
        'add_passenger_to_ride',
        params: {'passenger_id': invite.inviterId!, 'ride_id': invite.inviteeTripId!},
      );

      await supabase.from('invites').delete().eq('id', invite.id!);

      await supabase.from('rides').delete().eq("trip_id", deletionId);

      if (response != null) {
        await supabase.from('invites').update({"is_accepted": false}).eq(
          'id',
          invite.id.toString(),
        );
      }

      return "OK";
    } catch (e) {
      return "ERROR ${e.toString()}";
    }
  }

  @override
  Future<String> deleteInvite(InviteModel invite) async {
    try {
      await supabase.from('invites').delete().eq('id', invite.id!);
      return "OK";
    } catch (e) {
      return "ERROR ${e.toString()}";
    }
  }
}
