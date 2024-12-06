import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/date_time_extensions.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/app/extensions/string_extension.dart';
import 'package:unipool/app/shared/toast/custom_toast.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:unipool/features/my_trips/bloc/my_trips_bloc.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/share_trip/cubits/passenger_count_cubit.dart';
import 'package:unipool/features/share_trip/cubits/trip_route_cubit.dart';
import 'package:unipool/features/share_trip/cubits/trip_time_cubit.dart';
import 'package:unipool/features/share_trip/cubits/trip_type_cubit.dart';
import 'package:unipool/features/share_trip/domain/models/share_trip_request_model.dart';

part 'widgets/trip_type_selector.dart';
part 'widgets/trip_type_button.dart';
part 'widgets/date_time_picker.dart';
part 'widgets/share_button.dart';
part 'widgets/trip_route_selection.dart';
part 'widgets/section_title.dart';
part 'widgets/location_icons.dart';
part 'widgets/passenger_count_selection.dart';
part 'mixins/share_button_mixin.dart';

@RoutePage()
final class ShareTripView extends StatelessWidget {
  const ShareTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TripTimeCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<TripRouteCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<TripTypeCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<PassengerCountCubit>(
          create: (context) => getIt.call(),
        ),
      ],
      child: const ShareTripBody(),
    );
  }
}

final class ShareTripBody extends StatelessWidget {
  const ShareTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          AppDesignConstants.horizontalPaddingMedium,
        ),
        child: const _ShareButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppDesignConstants.spacingLarge),
            const _TripRouteSelection(),
            SizedBox(height: AppDesignConstants.spacingLarge),
            const _DateTimePicker(),
            SizedBox(height: AppDesignConstants.spacingLarge),
            const _TripTypeSelector(),
            SizedBox(height: AppDesignConstants.spacingLarge),
            const _PassengerCountSelection(),
          ],
        ),
      ),
    );
  }
}
