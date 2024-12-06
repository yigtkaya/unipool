import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/date_time_extensions.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/invite/invite_list_sheet.dart';
import 'package:unipool/features/landing/bloc/location_bloc/location_bloc.dart';
import 'package:unipool/features/landing/bloc/trips_bloc/trips_bloc.dart';
import 'package:unipool/features/landing/cubit/map_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:unipool/features/my_trips/bloc/my_trips_bloc.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/my_trips/presentation/my_trips_view.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'widgets/current_location_button.dart';
part 'widgets/current_location_marker.dart';
part 'widgets/location_display_for_list_item.dart';
part 'widgets/google_map.dart';
part 'widgets/refresh_button.dart';
part 'widgets/trip_list_item.dart';
part 'mixins/google_map_mixin.dart';
part 'mixins/marker_creator.dart';
part 'widgets/map_filter_search.dart';
part 'widgets/cluster_list_sheet.dart';
part 'mixins/trip_detail_mixin.dart';
part 'widgets/trip_details_bottom_sheet.dart';
part 'mixins/cluster_manager.dart';

@RoutePage()
class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<TripsBloc>(
            create: (context) => getIt.call()
              ..add(
                FilterTripsEvent(
                  from: '',
                  to: '',
                  dateTime: null,
                  userId: userId.toString(),
                ),
              ),
          ),
          BlocProvider<LocationBloc>(
            create: (context) => getIt.call()..add(StartLocationUpdates()),
          ),
          BlocProvider<MapCubit>(
            create: (context) => getIt.call(),
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              // Clear marker cache on logout
              MarkerCreator().clearCache();
            }
          },
          child: const _GoogleMapView(),
        ),
      ),
    );
  }
}
