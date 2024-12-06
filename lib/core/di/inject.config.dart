// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../app/handlers/location_handler.dart' as _i647;
import '../../app/handlers/messaging_handler.dart' as _i50;
import '../../features/auth/bloc/auth_bloc.dart' as _i55;
import '../../features/auth/data/auth_repository_impl.dart' as _i781;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart' as _i897;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/logout_use_case.dart' as _i698;
import '../../features/auth/domain/use_cases/sign_up_case.dart' as _i116;
import '../../features/comments/bloc/comments_bloc.dart' as _i87;
import '../../features/comments/domain/repository/comment_repository.dart' as _i465;
import '../../features/comments/domain/use_cases/add_comment_use_case.dart' as _i161;
import '../../features/comments/domain/use_cases/delete_comment_use_case.dart' as _i124;
import '../../features/comments/domain/use_cases/fetch_comments_use_case.dart' as _i12;
import '../../features/invite/bloc/invites_bloc.dart' as _i409;
import '../../features/invite/cubit/invite_selection_cubit.dart' as _i21;
import '../../features/invite/domain/repository/invites_repository.dart' as _i872;
import '../../features/invite/domain/use_cases/confirm_invite_use_case.dart' as _i1036;
import '../../features/invite/domain/use_cases/delete_invite_use_case.dart' as _i319;
import '../../features/invite/domain/use_cases/fetch_invites_use_case.dart' as _i543;
import '../../features/landing/bloc/location_bloc/location_bloc.dart' as _i983;
import '../../features/landing/bloc/trips_bloc/trips_bloc.dart' as _i738;
import '../../features/landing/cubit/map_cubit.dart' as _i1014;
import '../../features/landing/data/trips_repository_impl.dart' as _i111;
import '../../features/landing/domain/trips_repository.dart' as _i800;
import '../../features/landing/domain/use_cases/get_filtered_trips.dart' as _i1061;
import '../../features/messages/bloc/chat_room_bloc.dart' as _i606;
import '../../features/messages/domain/messages_repository.dart' as _i111;
import '../../features/messages/domain/use_cases/create_room_use_case.dart' as _i793;
import '../../features/messages/domain/use_cases/delete_room_use_case.dart' as _i846;
import '../../features/messages/domain/use_cases/get_room_messages_use_case.dart' as _i948;
import '../../features/messages/domain/use_cases/get_user_rooms_use_case.dart' as _i626;
import '../../features/messages/domain/use_cases/send_message_use_case.dart' as _i545;
import '../../features/messages/presentation/cubit/message_cubit.dart' as _i85;
import '../../features/my_trips/bloc/my_trips_bloc.dart' as _i386;
import '../../features/my_trips/domain/repository/my_trips_repository.dart' as _i792;
import '../../features/my_trips/domain/use_cases/fetch_my_trips_use_case.dart' as _i331;
import '../../features/my_trips/domain/use_cases/invite_user_to_trip_use_case.dart' as _i575;
import '../../features/my_trips/domain/use_cases/share_trip_use_case.dart' as _i982;
import '../../features/permissions/bloc/permissions_bloc.dart' as _i438;
import '../../features/permissions/service/permission_handler.dart' as _i997;
import '../../features/profile/bloc/profile_bloc.dart' as _i40;
import '../../features/profile/create_profile/cubit/birthday_cubit.dart' as _i478;
import '../../features/profile/create_profile/cubit/department_cubit.dart' as _i132;
import '../../features/profile/create_profile/cubit/gender_cubit.dart' as _i169;
import '../../features/profile/create_profile/cubit/phone_number_cubit.dart' as _i463;
import '../../features/profile/create_profile/cubit/profile_image_cubit.dart' as _i619;
import '../../features/profile/create_profile/cubit/school_cubit.dart' as _i54;
import '../../features/profile/create_profile/cubit/student_pdf_cubit.dart' as _i135;
import '../../features/profile/data/profile_repository_impl.dart' as _i206;
import '../../features/profile/domain/repository/profile_repository.dart' as _i364;
import '../../features/profile/domain/use_cases/fetch_profile_use_case.dart' as _i825;
import '../../features/profile/domain/use_cases/update_profile_use_case.dart' as _i186;
import '../../features/profile/domain/use_cases/upload_profile_photo_use_case.dart' as _i895;
import '../../features/profile/domain/use_cases/upload_student_pdf_use_case.dart' as _i378;
import '../../features/search_location/bloc/search_location_bloc.dart' as _i194;
import '../../features/search_location/data/datasources/geoapify_datasource.dart' as _i206;
import '../../features/share_trip/cubits/passenger_count_cubit.dart' as _i148;
import '../../features/share_trip/cubits/trip_route_cubit.dart' as _i651;
import '../../features/share_trip/cubits/trip_time_cubit.dart' as _i856;
import '../../features/share_trip/cubits/trip_type_cubit.dart' as _i613;
import '../../localization/local_bloc/language_bloc.dart' as _i562;
import '../constants/app_design_constant.dart' as _i858;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1014.MapCubit>(() => _i1014.MapCubit());
    gh.factory<_i85.MessageCubit>(() => _i85.MessageCubit());
    gh.factory<_i194.SearchLocationBloc>(() => _i194.SearchLocationBloc());
    gh.factory<_i613.TripTypeCubit>(() => _i613.TripTypeCubit());
    gh.factory<_i856.TripTimeCubit>(() => _i856.TripTimeCubit());
    gh.factory<_i148.PassengerCountCubit>(() => _i148.PassengerCountCubit());
    gh.factory<_i651.TripRouteCubit>(() => _i651.TripRouteCubit());
    gh.factory<_i21.InviteSelectionCubit>(() => _i21.InviteSelectionCubit());
    gh.factory<_i169.GenderCubit>(() => _i169.GenderCubit());
    gh.factory<_i463.PhoneCubit>(() => _i463.PhoneCubit());
    gh.factory<_i132.DepartmentCubit>(() => _i132.DepartmentCubit());
    gh.factory<_i619.ProfileImageCubit>(() => _i619.ProfileImageCubit());
    gh.factory<_i135.StudentPdfCubit>(() => _i135.StudentPdfCubit());
    gh.factory<_i54.SchoolCubit>(() => _i54.SchoolCubit());
    gh.factory<_i478.BirthdayCubit>(() => _i478.BirthdayCubit());
    gh.factory<_i562.LanguageBloc>(() => _i562.LanguageBloc());
    gh.lazySingleton<_i858.AppDesignConstants>(() => _i858.AppDesignConstants());
    gh.lazySingleton<_i647.LocationHandler>(() => _i647.LocationHandler());
    gh.lazySingleton<_i50.MessagingHandler>(() => _i50.MessagingHandler());
    gh.lazySingleton<_i997.PermissionHandler>(() => _i997.PermissionHandler());
    gh.factory<_i792.MyTripsRepository>(() => _i792.MyTripsRepositoryImpl());
    gh.factory<_i961.AuthRepository>(() => _i781.AuthRepositoryImpl());
    gh.factory<_i800.TripsRepository>(() => _i111.TripsRepositoryImpl());
    gh.factory<_i1061.FilterTripsUseCase>(() => _i1061.FilterTripsUseCase(gh<_i800.TripsRepository>()));
    gh.factory<_i982.ShareTripUseCase>(() => _i982.ShareTripUseCase(gh<_i792.MyTripsRepository>()));
    gh.factory<_i331.FetchMyTripsUseCase>(() => _i331.FetchMyTripsUseCase(gh<_i792.MyTripsRepository>()));
    gh.factory<_i465.CommentsRepository>(() => _i465.CommentsRepositoryImpl());
    gh.factory<_i872.InviteRepository>(() => _i872.InviteRepositoryImpl());
    gh.factory<_i111.MessagesRepository>(() => _i111.MessagesRepositoryImpl());
    gh.factory<_i364.ProfileRepository>(() => _i206.UserRepositoryImpl());
    gh.factory<_i161.AddCommentUseCase>(() => _i161.AddCommentUseCase(gh<_i465.CommentsRepository>()));
    gh.factory<_i124.DeleteCommentUseCase>(() => _i124.DeleteCommentUseCase(gh<_i465.CommentsRepository>()));
    gh.factory<_i12.FetchCommentsUseCase>(() => _i12.FetchCommentsUseCase(gh<_i465.CommentsRepository>()));
    gh.factory<_i87.CommentsBloc>(() => _i87.CommentsBloc(
          fetchCommentsUseCase: gh<_i12.FetchCommentsUseCase>(),
          addCommentUseCase: gh<_i161.AddCommentUseCase>(),
          deleteCommentUseCase: gh<_i124.DeleteCommentUseCase>(),
        ));
    gh.factory<_i948.GetRoomMessagesUseCase>(() => _i948.GetRoomMessagesUseCase(gh<_i111.MessagesRepository>()));
    gh.factory<_i846.DeleteRoomUseCase>(() => _i846.DeleteRoomUseCase(gh<_i111.MessagesRepository>()));
    gh.factory<_i793.CreateDirectMessageRoomUseCase>(
        () => _i793.CreateDirectMessageRoomUseCase(gh<_i111.MessagesRepository>()));
    gh.factory<_i626.GetUserRoomsUseCase>(() => _i626.GetUserRoomsUseCase(gh<_i111.MessagesRepository>()));
    gh.factory<_i545.SendMessageUseCase>(() => _i545.SendMessageUseCase(gh<_i111.MessagesRepository>()));
    gh.factory<_i983.LocationBloc>(() => _i983.LocationBloc(locationHandler: gh<_i647.LocationHandler>()));
    gh.factory<_i825.FetchProfileUseCase>(
        () => _i825.FetchProfileUseCase(profileRepository: gh<_i364.ProfileRepository>()));
    gh.factory<_i438.PermissionBloc>(() => _i438.PermissionBloc(permissionHandler: gh<_i997.PermissionHandler>()));
    gh.factory<_i319.DeleteInviteUseCase>(() => _i319.DeleteInviteUseCase(gh<_i872.InviteRepository>()));
    gh.factory<_i1036.ConfirmInviteUseCase>(() => _i1036.ConfirmInviteUseCase(gh<_i872.InviteRepository>()));
    gh.factory<_i575.InviteUserToTripUseCase>(() => _i575.InviteUserToTripUseCase(gh<_i792.MyTripsRepository>()));
    gh.lazySingleton<_i206.GeoapifyDataSource>(() => _i206.GeoapifyDataSource(apiKey: gh<String>()));
    gh.factory<_i698.LogoutUseCase>(() => _i698.LogoutUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i116.SignUpUseCase>(() => _i116.SignUpUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i1038.LoginUseCase>(() => _i1038.LoginUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i897.ForgotPasswordUseCase>(() => _i897.ForgotPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i543.FetchInvitesUseCase>(() => _i543.FetchInvitesUseCase(repository: gh<_i872.InviteRepository>()));
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(
          gh<_i1038.LoginUseCase>(),
          gh<_i116.SignUpUseCase>(),
          gh<_i698.LogoutUseCase>(),
          gh<_i897.ForgotPasswordUseCase>(),
        ));
    gh.factory<_i738.TripsBloc>(() => _i738.TripsBloc(filterTripsUseCase: gh<_i1061.FilterTripsUseCase>()));
    gh.factory<_i606.ChatRoomBloc>(() => _i606.ChatRoomBloc(
          gh<_i948.GetRoomMessagesUseCase>(),
          gh<_i545.SendMessageUseCase>(),
          gh<_i793.CreateDirectMessageRoomUseCase>(),
          gh<_i626.GetUserRoomsUseCase>(),
          gh<_i846.DeleteRoomUseCase>(),
        ));
    gh.factory<_i378.UploadStudentPdfUseCase>(() => _i378.UploadStudentPdfUseCase(gh<_i364.ProfileRepository>()));
    gh.factory<_i186.UpdateProfileUseCase>(() => _i186.UpdateProfileUseCase(gh<_i364.ProfileRepository>()));
    gh.factory<_i895.UploadProfilePhotoUseCase>(() => _i895.UploadProfilePhotoUseCase(gh<_i364.ProfileRepository>()));
    gh.factory<_i386.MyTripsBloc>(() => _i386.MyTripsBloc(
          gh<_i331.FetchMyTripsUseCase>(),
          gh<_i982.ShareTripUseCase>(),
          gh<_i575.InviteUserToTripUseCase>(),
        ));
    gh.factory<_i40.ProfileBloc>(() => _i40.ProfileBloc(
          gh<_i825.FetchProfileUseCase>(),
          gh<_i895.UploadProfilePhotoUseCase>(),
          gh<_i186.UpdateProfileUseCase>(),
          gh<_i378.UploadStudentPdfUseCase>(),
        ));
    gh.factory<_i409.InvitesBloc>(() => _i409.InvitesBloc(
          fetchInvites: gh<_i543.FetchInvitesUseCase>(),
          deleteInvite: gh<_i319.DeleteInviteUseCase>(),
          confirmInvite: gh<_i1036.ConfirmInviteUseCase>(),
        ));
    return this;
  }
}
