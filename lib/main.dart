import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unipool/core/constants/app_constants.dart';
import 'package:unipool/core/constants/app_design_constant.dart';
import 'package:unipool/core/di/inject.dart';
import 'package:unipool/core/observers/custom_route_observer.dart';
import 'package:unipool/core/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipool/app/theme/theme.dart';
import 'package:unipool/features/auth/bloc/auth_bloc.dart';
import 'package:unipool/features/my_trips/bloc/my_trips_bloc.dart';
import 'package:unipool/features/permissions/bloc/permissions_bloc.dart';
import 'package:unipool/features/profile/bloc/profile_bloc.dart';
import 'package:unipool/localization/app_localizations.dart';
import 'package:unipool/localization/local_bloc/language_bloc.dart';
import 'dart:async';
import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unipool/core/observers/bloc_observer.dart';
import 'package:unipool/firebase_options.dart';

part 'app/initializer.dart';
part 'app/app.dart';
part 'app/setup.dart';

void main() {
  setup(
    () => _Initializer(
      child: _App(),
    ),
  );
}
