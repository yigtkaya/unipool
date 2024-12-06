// ignore_for_file: use_build_context_synchronously

part of '../profile_view.dart';

final class _SettingsList extends StatefulWidget {
  const _SettingsList();

  @override
  State<_SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<_SettingsList> with _SettingsMixin, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionBloc, PermissionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.applicationSettings,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.kSecondary900,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacing,
            ),
            _SettingsGroup([
              _SettingsItem(
                icon: LucideIcons.bell,
                title: context.l10n.notificationPermission,
                switchValue: state.permissions[Permission.notification]?.isGranted ?? false,
                onSwitchChanged: (value) async {
                  if (value) {
                    final status = await Permission.notification.status;
                    if (status.isPermanentlyDenied) {
                      // Show dialog explaining they need to enable it in settings
                      await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(context.l10n.notificationPermission),
                            content: Text(context.l10n.notificationPermissionRationale),
                            actions: <Widget>[
                              TextButton(
                                child: Text(context.l10n.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(context.l10n.confirm),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  openAppSettings();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      final shouldShowRationale = await Permission.notification.shouldShowRequestRationale;
                      if (shouldShowRationale) {
                        _showRationaleDialog(
                          context,
                          context.l10n.notificationPermission,
                          context.l10n.notificationPermissionRationale,
                          () {
                            context.read<PermissionBloc>().add(
                                  const RequestPermissionEvent(Permission.notification),
                                );
                          },
                        );
                      } else {
                        context.read<PermissionBloc>().add(
                              const RequestPermissionEvent(Permission.notification),
                            );
                      }
                    }
                  } else {
                    openAppSettings();
                  }
                },
              ),
              _SettingsItem(
                icon: LucideIcons.map_pin,
                title: context.l10n.locationPermission,
                switchValue: state.permissions[Permission.locationWhenInUse]?.isGranted ?? false,
                onSwitchChanged: (value) async {
                  if (value) {
                    final status = await Permission.locationWhenInUse.status;
                    if (status.isPermanentlyDenied) {
                      // Show dialog explaining they need to enable it in settings
                      await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(context.l10n.locationPermission),
                            content: Text(context.l10n.locationPermissionRationale),
                            actions: <Widget>[
                              TextButton(
                                child: Text(context.l10n.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(context.l10n.confirm),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  openAppSettings();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      final shouldShowRationale = await Permission.locationWhenInUse.shouldShowRequestRationale;
                      if (shouldShowRationale) {
                        _showRationaleDialog(
                          context,
                          context.l10n.locationPermission,
                          context.l10n.locationPermissionRationale,
                          () {
                            context.read<PermissionBloc>().add(
                                  const RequestPermissionEvent(Permission.locationWhenInUse),
                                );
                          },
                        );
                      } else {
                        context.read<PermissionBloc>().add(
                              const RequestPermissionEvent(Permission.locationWhenInUse),
                            );
                      }
                    }
                  } else {
                    openAppSettings();
                  }
                },
              ),
              _SettingsItem(
                icon: LucideIcons.globe,
                title: context.l10n.language,
                subtitle: context.read<LanguageBloc>().state.selectedLanguage.name,
                onTap: showLanguagePickerBottomSheet,
              ),
            ]),
            SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            Text(
              context.l10n.supportFeedback,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.kSecondary800,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacing,
            ),
            _SettingsGroup([
              _SettingsItem(
                icon: LucideIcons.message_circle,
                title: context.l10n.sendFeedback,
                onTap: () {
                  context.router.push(const FeedbackRoute());
                },
              ),
              _SettingsItem(
                icon: LucideIcons.share,
                title: context.l10n.shareWithFriends,
                onTap: onShareApp,
              ),
              _SettingsItem(
                icon: LucideIcons.message_circle_question,
                title: context.l10n.helpCenter,
                onTap: () {
                  context.router.push(const ResetPasswordRoute());
                },
              ),
            ]),
            SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  context.router.replaceAll([LoginRoute()]);
                }
              },
              child: _SettingsItem(
                icon: LucideIcons.log_out,
                title: context.l10n.logout,
                onTap: onLogout,
              ),
            ),
            SizedBox(
              height: AppDesignConstants.spacingLarge * 1.2,
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<PermissionBloc>().add(const CheckPermissionsEvent());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Check permissions again when app resumes
      if (mounted) {
        context.read<PermissionBloc>().add(const CheckPermissionsEvent());
      }
    }
  }

  Future<void> _showRationaleDialog(BuildContext context, String title, String message, VoidCallback onConfirm) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(context.l10n.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(context.l10n.confirm),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }
}

final class _SettingsGroup extends StatelessWidget {
  final List<_SettingsItem> items;

  const _SettingsGroup(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: List.generate(items.length * 2 - 1, (index) {
          if (index.isOdd) {
            return const Divider(
              height: 2,
              color: AppColors.kGreyLight1,
            );
          }
          return items[index ~/ 2];
        }),
      ),
    );
  }
}
