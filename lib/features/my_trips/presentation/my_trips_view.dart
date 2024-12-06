import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/app/extensions/date_time_extensions.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/invite/bloc/invites_bloc.dart';
import 'package:unipool/features/landing/presentation/widgets/profile_photo.dart';
import 'package:unipool/features/my_trips/bloc/my_trips_bloc.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
import 'package:unipool/features/my_trips/domain/models/trip_model.dart';
import 'package:unipool/features/my_trips/presentation/widgets/sticky_header_delegate.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unipool/features/profile/profile/profile_view_others.dart';

part 'widgets/location_display.dart';
part 'widgets/invite_list_tile.dart';
part 'widgets/trip_item.dart';
part 'widgets/driver_info.dart';
part 'widgets/remaining_seats_chip.dart';
part 'widgets/trip_item_shimmer.dart';
part 'widgets/trip_item_detail_bottom_sheet.dart';
part 'widgets/filter_chip_row.dart';
part 'mixins/trip_item_mixin.dart';
part 'widgets/trips_section.dart';

@RoutePage()
final class MyTripsView extends StatefulWidget {
  const MyTripsView({super.key});

  @override
  State<MyTripsView> createState() => _MyTripsViewState();
}

class _MyTripsViewState extends State<MyTripsView> {
  @override
  void initState() {
    super.initState();
    final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
    context.read<MyTripsBloc>().add(LoadMyTrips(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return const MyTripsBody();
  }
}

final class MyTripsBody extends StatelessWidget {
  const MyTripsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.myTrips,
          style: context.textTheme.titleSmall,
        ),
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final userId = (context.read<ProfileBloc>().state as ProfileLoaded).profile.id!;
          context.read<MyTripsBloc>().add(LoadMyTrips(userId: userId));
        },
        color: AppColors.kPrimary100,
        backgroundColor: AppColors.kWhite,
        child: BlocBuilder<MyTripsBloc, MyTripsState>(
          builder: (context, state) {
            if (state is MyTripsLoading) {
              return ListView(
                children: [
                  TripItemShimmer(),
                  TripItemShimmer(),
                ],
              );
            }

            if (state is MyTripsLoaded) {
              // if its all empty show a text
              if (state.ongoingTrip == null && state.upcomingTrips.isEmpty && state.pastTrips.isEmpty) {
                return ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDesignConstants.horizontalPaddingMedium,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Center(
                          child: Text(
                            context.l10n.noTripsYet,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.kGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return CustomScrollView(
                slivers: [
                  const FilterChipRow(),
                  if (state.ongoingTrip != null && _shouldShowTrip(state.ongoingTrip!, state.selectedFilter))
                    TripsSection(
                      trips: [state.ongoingTrip!],
                      title: context.l10n.ongoing,
                    ),
                  TripsSection(
                    trips: state.upcomingTrips.where((trip) => _shouldShowTrip(trip, state.selectedFilter)).toList(),
                    title: context.l10n.activeTrips,
                  ),
                  TripsSection(
                    trips: state.pastTrips.where((trip) => _shouldShowTrip(trip, state.selectedFilter)).toList(),
                    title: context.l10n.pastTrips,
                  ),
                ],
              );
            }

            if (state is MyTripsError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.kGrey,
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  bool _shouldShowTrip(TripsResponseModel trip, TripFilter filter) {
    switch (filter) {
      case TripFilter.driver:
        return trip.trip.type == TripType.lookingPassenger;
      case TripFilter.passenger:
        return trip.trip.type == TripType.lookingDriver;
    }
  }
}
