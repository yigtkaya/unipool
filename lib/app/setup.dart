part of '../main.dart';

Future<void> setup(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await firebaseConfig();

    await dotenv.load();

    Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'),
      anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    );

    await configureDependencies();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );

    Bloc.observer = const AppBlocObserver();

    runApp(
      await builder(),
    );
  }, (error, stack) {
    log(
      error.toString(),
      stackTrace: stack,
      name: AppConstants.initFunctionName,
    );
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: false,
    );
  });
}

/// Configure the firebase services
Future<void> firebaseConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.logAppOpen();
}
