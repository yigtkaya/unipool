part of '../profile_view.dart';

mixin _SettingsMixin on State<_SettingsList> {
  void navigateToNotifications() {
    // TODO: Navigate to notifications settings
  }

  void showLanguagePickerBottomSheet() {
    showBarModalBottomSheet(
      context: context,
      expand: false,
      builder: (context) {
        return const _LanguagePickerBottomSheet();
      },
    );
  }

  void navigateToLocationSettings() {
    // TODO: Navigate to location settings
  }

  void navigateToPrivacyPolicy() {
    // TODO: Navigate to privacy policy
  }

  void navigateToTermsOfService() {
    // TODO: Navigate to terms of service
  }

  void navigateToAboutUs() {
    // TODO: Navigate to about us
  }

  void navigateToHelpCenter() {
    // TODO: Navigate to contact us
  }

  void onShareApp() {
    final url = 'https://example.com'; // TODO WITH APP URLS
    Share.share(
      context.l10n.shareApp(url),
    );
  }

  void onLogout() {
    context.read<AuthBloc>().add(LogOutEvent());
  }
}
