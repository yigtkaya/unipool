import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/app/shared/form_areas/custom_area.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/features/search_location/bloc/search_location_bloc.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';
import 'package:unipool/features/share_trip/cubits/trip_route_cubit.dart';

part 'mixins/search_fields_mixin.dart';
part 'widgets/search_fields.dart';
part 'widgets/search_results.dart';

@RoutePage()
class SearchLocationView extends StatelessWidget {
  final TripRouteCubit tripRouteCubit;
  const SearchLocationView({
    required this.tripRouteCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchLocationBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider.value(
          value: tripRouteCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: context.router.back,
          ),
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite,
          scrolledUnderElevation: 1,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
            vertical: AppDesignConstants.verticalPaddingMedium,
          ),
          child: const _SearchContainer(),
        ),
      ),
    );
  }
}
