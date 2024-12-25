import 'package:chat_zag/Core/Home/Logic/home_cubit.dart';
import 'package:chat_zag/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Core/Home/Presentation/Screens/home_page.dart';


class AppRouts {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => HomeCubit(),
                  child: const MyHomePage(title: 'Chat App',)),
        );

      default:
        return null;
    }
  }
}
