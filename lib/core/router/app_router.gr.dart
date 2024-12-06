// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BottomNavigationView]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavigationView();
    },
  );
}

/// generated route for
/// [ChatRoomView]
class ChatRoomRoute extends PageRouteInfo<void> {
  const ChatRoomRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatRoomView();
    },
  );
}

/// generated route for
/// [CreateProfileView]
class CreateProfileRoute extends PageRouteInfo<void> {
  const CreateProfileRoute({List<PageRouteInfo>? children})
      : super(
          CreateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateProfileView();
    },
  );
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfileView();
    },
  );
}

/// generated route for
/// [FeedbackView]
class FeedbackRoute extends PageRouteInfo<void> {
  const FeedbackRoute({List<PageRouteInfo>? children})
      : super(
          FeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FeedbackView();
    },
  );
}

/// generated route for
/// [ForgotPasswordView]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordView();
    },
  );
}

/// generated route for
/// [LandingPageView]
class LandingPageRoute extends PageRouteInfo<void> {
  const LandingPageRoute({List<PageRouteInfo>? children})
      : super(
          LandingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LandingPageView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [MessagesView]
class MessagesRoute extends PageRouteInfo<MessagesRouteArgs> {
  MessagesRoute({
    required ProfileModel otherParticipant,
    required String roomId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MessagesRoute.name,
          args: MessagesRouteArgs(
            otherParticipant: otherParticipant,
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MessagesRouteArgs>();
      return MessagesView(
        otherParticipant: args.otherParticipant,
        roomId: args.roomId,
        key: args.key,
      );
    },
  );
}

class MessagesRouteArgs {
  const MessagesRouteArgs({
    required this.otherParticipant,
    required this.roomId,
    this.key,
  });

  final ProfileModel otherParticipant;

  final String roomId;

  final Key? key;

  @override
  String toString() {
    return 'MessagesRouteArgs{otherParticipant: $otherParticipant, roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [MyTripsView]
class MyTripsRoute extends PageRouteInfo<void> {
  const MyTripsRoute({List<PageRouteInfo>? children})
      : super(
          MyTripsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTripsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyTripsView();
    },
  );
}

/// generated route for
/// [NonApprovedUserView]
class NonApprovedUserRoute extends PageRouteInfo<void> {
  const NonApprovedUserRoute({List<PageRouteInfo>? children})
      : super(
          NonApprovedUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonApprovedUserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NonApprovedUserView();
    },
  );
}

/// generated route for
/// [PhotoDetailView]
class PhotoDetailRoute extends PageRouteInfo<PhotoDetailRouteArgs> {
  PhotoDetailRoute({
    Key? key,
    required String imageUrl,
    required String heroTag,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoDetailRoute.name,
          args: PhotoDetailRouteArgs(
            key: key,
            imageUrl: imageUrl,
            heroTag: heroTag,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhotoDetailRouteArgs>();
      return PhotoDetailView(
        key: args.key,
        imageUrl: args.imageUrl,
        heroTag: args.heroTag,
      );
    },
  );
}

class PhotoDetailRouteArgs {
  const PhotoDetailRouteArgs({
    this.key,
    required this.imageUrl,
    required this.heroTag,
  });

  final Key? key;

  final String imageUrl;

  final String heroTag;

  @override
  String toString() {
    return 'PhotoDetailRouteArgs{key: $key, imageUrl: $imageUrl, heroTag: $heroTag}';
  }
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordView();
    },
  );
}

/// generated route for
/// [RidesView]
class RidesRoute extends PageRouteInfo<void> {
  const RidesRoute({List<PageRouteInfo>? children})
      : super(
          RidesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RidesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RidesView();
    },
  );
}

/// generated route for
/// [RootView]
class RootRoute extends PageRouteInfo<RootRouteArgs> {
  RootRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          RootRoute.name,
          args: RootRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RootRouteArgs>();
      return RootView(
        key: args.key,
        userId: args.userId,
      );
    },
  );
}

class RootRouteArgs {
  const RootRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'RootRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [SearchLocationView]
class SearchLocationRoute extends PageRouteInfo<SearchLocationRouteArgs> {
  SearchLocationRoute({
    required TripRouteCubit tripRouteCubit,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchLocationRoute.name,
          args: SearchLocationRouteArgs(
            tripRouteCubit: tripRouteCubit,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchLocationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchLocationRouteArgs>();
      return SearchLocationView(
        tripRouteCubit: args.tripRouteCubit,
        key: args.key,
      );
    },
  );
}

class SearchLocationRouteArgs {
  const SearchLocationRouteArgs({
    required this.tripRouteCubit,
    this.key,
  });

  final TripRouteCubit tripRouteCubit;

  final Key? key;

  @override
  String toString() {
    return 'SearchLocationRouteArgs{tripRouteCubit: $tripRouteCubit, key: $key}';
  }
}

/// generated route for
/// [ShareTripView]
class ShareTripRoute extends PageRouteInfo<void> {
  const ShareTripRoute({List<PageRouteInfo>? children})
      : super(
          ShareTripRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShareTripRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShareTripView();
    },
  );
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpView();
    },
  );
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [StudentVerificationView]
class StudentVerificationRoute extends PageRouteInfo<void> {
  const StudentVerificationRoute({List<PageRouteInfo>? children})
      : super(
          StudentVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StudentVerificationView();
    },
  );
}
