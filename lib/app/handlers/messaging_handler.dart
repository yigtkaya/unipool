import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class MessagingHandler {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Request permission for notifications
      await _requestPermission();

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Handle foreground messages
      await _setupForegroundMessaging();

      // Handle notification open events
      await _setupNotificationOpenedApp();

      // Get initial message if app was opened from terminated state
      await _getInitialMessage();

      _isInitialized = true;
    } catch (e, stackTrace) {
      log(
        'Error initializing messaging handler',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined permission');
    }
  }

  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification tap
        _handleNotificationTap(details);
      },
    );
  }

  Future<void> _setupForegroundMessaging() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');

      if (message.notification != null) {
        _showLocalNotification(message);
      }
    });
  }

  Future<void> _setupNotificationOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
      _handleNotificationTap(
        NotificationResponse(
          notificationResponseType: NotificationResponseType.selectedNotification,
          payload: message.data.toString(),
        ),
      );
    });
  }

  Future<void> _getInitialMessage() async {
    final message = await _firebaseMessaging.getInitialMessage();
    if (message != null) {
      log('Got a message from terminated state!');
      _handleNotificationTap(
        NotificationResponse(
          notificationResponseType: NotificationResponseType.selectedNotification,
          payload: message.data.toString(),
        ),
      );
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );

    final iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      details,
      payload: message.data.toString(),
    );
  }

  void _handleNotificationTap(NotificationResponse details) {
    // Handle notification tap based on payload
    if (details.payload != null) {
      // Navigate to specific screen or perform action based on payload
      log('Notification tapped with payload: ${details.payload}');
    }
  }

  Future<String?> getToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  Future<void> deleteToken() async {
    try {
      await _firebaseMessaging.deleteToken();
    } catch (e) {
      log('Error deleting FCM token: $e');
    }
  }

  void dispose() {
    _isInitialized = false;
  }
}

// This function must be top-level (outside any class)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message: ${message.messageId}');
  // Add your background message handling logic here
}
