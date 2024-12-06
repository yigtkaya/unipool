import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/date_time_extensions.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/invite/cubit/invite_selection_cubit.dart';
import 'package:unipool/features/landing/presentation/widgets/profile_photo.dart';
import 'package:unipool/features/my_trips/bloc/my_trips_bloc.dart';
import 'package:unipool/features/my_trips/domain/models/fetch_trips_model.dart';
import 'package:unipool/features/my_trips/domain/models/invite_model.dart';
import 'package:unipool/features/overlay/custom_overlay_loader.dart';
import 'package:unipool/features/overlay/indicators/loading.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/features/profile/domain/model/profile_model.dart';

part 'widgets/invite_list_item.dart';

final class InviteListSheet extends StatelessWidget {
  final List<TripsResponseModel> trips;
  final ProfileModel inviteeProfile;
  final String inviteeTripId;
  const InviteListSheet({super.key, required this.trips, required this.inviteeProfile, required this.inviteeTripId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteSelectionCubit>(
      create: (context) => getIt.call(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
        ),
        child: Column(
          children: [
            SizedBox(height: AppDesignConstants.spacingMedium),
            Text(
              context.l10n.chooseInviterTrip,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge,
            ),
            Expanded(
              child: trips.isEmpty
                  ? Center(
                      child: Text(
                        context.l10n.noTripsYet,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: trips.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDesignConstants.horizontalPaddingMedium,
                        vertical: AppDesignConstants.verticalPaddingMedium,
                      ),
                      itemBuilder: (context, index) => InviteListItem(trip: trips[index]),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + AppDesignConstants.spacingMedium,
                left: AppDesignConstants.horizontalPaddingMedium,
                right: AppDesignConstants.horizontalPaddingMedium,
              ),
              child: BlocBuilder<InviteSelectionCubit, InviteSelectionState>(
                builder: (context, state) {
                  return BlocListener<MyTripsBloc, MyTripsState>(
                    listener: (context, state) {
                      if (state is MyTripsLoading) {
                        CustomOverlayLoader.show(
                          context,
                          indicatorType: Indicator.ballClipRotatePulse,
                        );
                      } else {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDesignConstants.verticalPaddingMedium,
                        ),
                        color: state.selectedTrip != null ? AppColors.kPrimary100 : AppColors.kGrey,
                        onPressed: state.selectedTrip != null
                            ? () {
                                final userProfile = (context.read<ProfileBloc>().state as ProfileLoaded).profile;
                                final inviteModel = InviteModel(
                                  inviterId: userProfile.id,
                                  inviterTripId: state.selectedTrip!.trip.tripId,
                                  inviteeId: inviteeProfile.id,
                                  inviteeTripId: inviteeTripId,
                                  isAccepted: false,
                                );
                                context.read<MyTripsBloc>().add(InviteUserToTrip(request: inviteModel));
                              }
                            : null,
                        child: Text(
                          context.l10n.invite,
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
