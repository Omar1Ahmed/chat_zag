part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {

  static String? token;

}

class NotificationReceived extends NotificationState {
  final String title;
  final String body;

  NotificationReceived(this.title, this.body);
}
