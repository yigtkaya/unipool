part of '../domain/repository/my_trips_repository.dart';

@Injectable(as: MyTripsRepository)
class MyTripsRepositoryImpl implements MyTripsRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<TripsResponseModel>>> getMyTrips(String userId) async {
    try {
      final response = await supabase.rpc(
        'fetch_my_trips',
        params: {'userid': userId},
      );

      if (response == null) return const Right([]);

      final tripsList = (response as List)
          .map(
            (e) => TripsResponseModelMapper.fromMap(e as Map<String, dynamic>),
          )
          .toList();
      return Right(tripsList);
    } on PostgrestException catch (e) {
      return Left(
        Failure(
          message: e.message,
          code: e.code.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Trip>> shareTrip(ShareTripRequestModel request) async {
    try {
      final response = await supabase
          .from("rides")
          .insert(
            request.toMap(),
          )
          .select()
          .single();

      if (response.isEmpty) {
        return Left(
          Failure(
            message: 'An error occurred',
            code: '500',
          ),
        );
      }

      return Right(
        TripMapper.fromMap(
          response,
        ),
      );
    } on PostgrestException catch (e) {
      return Left(
        Failure(
          message: e.message,
          code: e.code.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: 'An error occurred',
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> invite(InviteModel request) async {
    try {
      final response = await supabase.rpc(
        "create_invite",
        params: {
          "input_invitee_id": request.inviteeId,
          "input_inviter_id": request.inviterId,
          "input_inviter_trip_id": request.inviterTripId,
          "input_invitee_trip_id": request.inviteeTripId,
        },
      );

      return Right(response);
    } on StorageException catch (e) {
      return Left(Failure(message: e.message, code: e.statusCode.toString()));
    }
  }
}
