part of '../my_trips_view.dart';

final class TripDetailsBottomSheet extends StatelessWidget {
  final TripsResponseModel response;
  final bool isOwner;

  const TripDetailsBottomSheet({
    super.key,
    required this.response,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    final passengers = response.passengers.map((e) => ProfileModelMapper.fromMap(e as Map<String, dynamic>)).toList();

    return BlocProvider<InvitesBloc>(
      create: (context) => getIt.call()..add(LoadInvites(tripId: response.trip.tripId!)),
      child: Scaffold(
        backgroundColor: AppColors.kWhite,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDesignConstants.horizontalPaddingMedium,
                  vertical: AppDesignConstants.verticalPaddingLarge,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // Trip Header
                      _buildHeroWidget(
                        tag: 'trip_header_${response.trip.tripId}',
                        child: Text(
                          DateTime.tryParse(response.trip.departureTime.toString())!.formatForTripItem(),
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(height: AppDesignConstants.spacingLarge),

                      // Driver Info
                      _buildHeroWidget(
                        tag: 'driver_info_${response.trip.tripId}',
                        child: DriverInfo(
                          profile: response.ownerProfile,
                          isOwner: isOwner,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Location Display
                      _buildHeroWidget(
                        tag: 'location_display_${response.trip.tripId}',
                        child: LocationDisplay(
                          pickupAddress: response.trip.startDestination.formatted.toString(),
                          dropoffAddress: response.trip.finalDestination.formatted.toString(),
                          isDropoffOptional: true,
                        ),
                      ),

                      SizedBox(height: AppDesignConstants.spacingLarge * 2),

                      // Passengers Section
                      Text(
                        context.l10n.passengers,
                        style: context.textTheme.bodyLarge,
                      ),

                      if (passengers.isEmpty)
                        _buildEmptyState(
                          context,
                          message: context.l10n.noPassengers,
                        )
                      else
                        ...passengers.map(
                          (passenger) => ListTile(
                            onTap: () {
                              showBarModalBottomSheet(
                                context: context,
                                builder: (context) => ProfileViewOthers(
                                  profile: passenger,
                                ),
                              );
                            },
                            contentPadding: EdgeInsets.symmetric(
                              vertical: AppDesignConstants.verticalPaddingSmall,
                            ),
                            leading: ProfilePhoto(
                              profilePhoto: passenger.profilePhoto ?? '',
                              size: 48.r,
                            ),
                            title: Text(
                              '${passenger.name} ${passenger.surname}',
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                        ),

                      SizedBox(height: AppDesignConstants.spacingLarge * 2),
                      // Invites Section
                      if (isOwner) ...[
                        Text(
                          response.trip.type == TripType.lookingDriver ? context.l10n.invites : context.l10n.requests,
                          style: context.textTheme.bodyLarge,
                        ),
                        BlocConsumer<InvitesBloc, InvitesState>(
                          listener: (context, state) {
                            if (state is InvitesLoading) {
                              CustomOverlayLoader.show(
                                context,
                                indicatorType: Indicator.ballRotate,
                              );
                            } else {
                              Navigator.of(context, rootNavigator: true).pop();
                            }
                          },
                          builder: (context, state) {
                            if (state is InvitesLoading || state is InvitesInitial) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation(AppColors.kPrimary100),
                                ),
                              );
                            }

                            if (state is InvitesLoaded) {
                              if (state.invites.isEmpty) {
                                return _buildEmptyState(
                                  context,
                                  message: context.l10n.noInvites,
                                );
                              }

                              return Column(
                                children: state.invites
                                    .map((invite) => InviteListTile(invite: invite, trip: response.trip))
                                    .toList(),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroWidget({required String tag, required Widget child}) {
    return Material(
      type: MaterialType.transparency,
      child: Hero(
        tag: tag,
        child: child,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, {required String message}) {
    return Column(
      children: [
        SizedBox(height: AppDesignConstants.spacingLarge * 2),
        Center(
          child: Text(
            message,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kGrey,
            ),
          ),
        ),
      ],
    );
  }
}
