import 'package:dart_mappable/dart_mappable.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'invite_model.mapper.dart';

@MappableClass(ignoreNull: true)
class InviteModel with InviteModelMappable {
  const InviteModel({
    this.id,
    this.inviterId,
    this.inviterTripId,
    this.inviteeId,
    this.inviter,
    this.inviteeTripId,
    this.isAccepted,
  });

  final String? id;
  final ProfileModel? inviter;
  @MappableField(key: 'inviter_id')
  final String? inviterId;
  @MappableField(key: 'inviter_trip_id')
  final String? inviterTripId;
  @MappableField(key: 'invitee_id')
  final String? inviteeId;
  @MappableField(key: 'invitee_trip_id')
  final String? inviteeTripId;
  final bool? isAccepted;
}
