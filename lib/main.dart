import 'package:chat_zag/routing/appRouting.dart';
import 'package:chat_zag/routing/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Auth/Logic/auth_cubit.dart';
import 'Helpers/Notifications/notification_cubit.dart';
import 'Helpers/dioHelper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();


  FirebaseMessaging messaging = FirebaseMessaging.instance;


  NotificationCubit notificationCubit = NotificationCubit(messaging);
  await notificationCubit.initializeFirebaseMessaging(); // Execute once the app starts


  DioHelper.init();

  runApp(MyApp(
    appRouter: AppRouts(),
    notificationCubit: notificationCubit,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouts appRouter;
  final NotificationCubit notificationCubit;
  const MyApp({super.key, required this.appRouter, required this.notificationCubit});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context) => notificationCubit),

    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    ));
  }
}