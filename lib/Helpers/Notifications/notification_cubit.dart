import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final FirebaseMessaging _firebaseMessaging;

  NotificationCubit(this._firebaseMessaging) : super(NotificationInitial());

  initializeFirebaseMessaging() async {
 
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // Get FCM Token
      String? token = await _firebaseMessaging.getToken();
      print('FCM Token: $token');

      NotificationInitial.token = token ?? '';

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Foreground notification received: ${message.notification?.title}');

      });
    } else {
      print('User declined or has not granted permission');
    }
  }
}
