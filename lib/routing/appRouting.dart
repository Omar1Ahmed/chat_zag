import 'package:chat_zag/Core/Auth/Logic/auth_cubit.dart';
import 'package:chat_zag/Core/Auth/Presentation/Screens/login_screen.dart';
import 'package:chat_zag/Core/Auth/Presentation/Screens/signUp_screen.dart';
import 'package:chat_zag/Core/Home/Logic/home_cubit.dart';
import 'package:chat_zag/Core/Home/Presentation/Screens/place_holder.dart';
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
                  child: const MyHomePage()),
        );
        case Routes.resposivePlaceHolder:
         return MaterialPageRoute(builder: (_) => const ResponsivePlaceHolder());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(),
                  child: LoginScreen(),
        ));

        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(),
                  child: SingUpScreen(),
        ));

      default:
        return null;
    }
  }
}
