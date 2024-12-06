import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/network/failure.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/share_trip/domain/models/share_trip_request_model.dart';

part '../../data/my_trips_repository_impl.dart';

abstract interface class MyTripsRepository {
  Future<Either<Failure, List<TripsResponseModel>>> getMyTrips(String userId);
  Future<Either<Failure, Trip>> shareTrip(ShareTripRequestModel request);
  Future<Either<Failure, String>> invite(InviteModel request);
}
