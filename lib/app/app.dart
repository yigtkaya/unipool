part of '../main.dart';

final class _App extends StatelessWidget {
  _App();

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: AppDesignConstants.designSize,
          minTextAdapt: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [
                CustomRouteObserver(),
              ],
            ),
            locale: state.selectedLanguage.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            theme: LightTheme.theme,
          ),
        );
      },
    );
  }
}
