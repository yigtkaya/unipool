import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unipool/app/shared/photo/photo_detail_view.dart';
import 'package:unipool/features/auth/presentation/forgot_password/forgot_password_view.dart';
import 'package:unipool/features/auth/presentation/login/login_view.dart';
import 'package:unipool/features/auth/presentation/reset_password/reset_password_view.dart';
import 'package:unipool/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:unipool/features/bottom_navigation/root_view.dart';
import 'package:unipool/features/feedback/feedback_view.dart';
import 'package:unipool/features/landing/presentation/landing_page_view.dart';
import 'package:unipool/features/messages/presentation/chat_rooms_view.dart';
import 'package:unipool/features/messages/presentation/messages_view.dart';
import 'package:unipool/features/my_trips/presentation/my_trips_view.dart';
import 'package:unipool/features/non_approved_user/non_approved_user_view.dart';
import 'package:unipool/features/profile/create_profile/create_profile_view.dart';
import 'package:unipool/features/profile/create_profile/student_verification_view.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:unipool/features/profile/edit_profile/edit_profile_view.dart';
import 'package:unipool/features/profile/profile/profile_view.dart';
import 'package:unipool/features/rides/presentation/rides_view.dart';
import 'package:unipool/features/search_location/presentation/search_location_view.dart';
import 'package:unipool/features/share_trip/cubits/trip_route_cubit.dart';
import 'package:unipool/features/share_trip/presentation/share_trip_view.dart';
import 'package:unipool/features/splash/splash_view.dart';
part 'app_router.gr.dart';

// Add this at the top of the file
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// AppRouter is the main router of the app.
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: rootNavigatorKey);

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: LoginRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: SignUpRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: ForgotPasswordRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: CreateProfileRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: StudentVerificationRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: NonApprovedUserRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: EditProfileRoute.page,
        ),
        AutoRoute(
          page: PhotoDetailRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideBottom,
          page: SearchLocationRoute.page,
          fullscreenDialog: true,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: MessagesRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: FeedbackRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: ResetPasswordRoute.page,
        ),
        AutoRoute(
          page: RootRoute.page,
          children: [
            AutoRoute(page: LandingPageRoute.page),
            AutoRoute(page: ShareTripRoute.page),
            AutoRoute(page: ChatRoomRoute.page),
            AutoRoute(page: MyTripsRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
