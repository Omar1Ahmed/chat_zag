import 'package:chat_zag/Helpers/extantions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Responsive/ui_component/info_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../routing/routs.dart';
import '../../Logic/auth_cubit.dart';
import '../Widgets/AuthenteicationTextFieldWidget.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget(
        builder: ( context,  deviceinfo) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Container(
                height: deviceinfo.screenHeight,
                width: deviceinfo.screenWidth,
                color: ColorsManager.primaryColor,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: deviceinfo.screenWidth * 0.05, end: deviceinfo.screenWidth * 0.05, top: deviceinfo.screenHeight * 0.2, bottom: deviceinfo.screenHeight * 0.07),
                  child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          context.pushNamed(Routes.homePage);
                        }
                      }, builder: (context, state) {

                    return Column(
                     // spacing: deviceinfo.screenHeight * 0.04,
                      children: [

                        Column(
                          children: [
                        Text("Hello Again!", style: TextStyle(fontSize: deviceinfo.screenWidth * 0.08, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text("Sign in to your account", style: TextStyle(fontSize: deviceinfo.screenWidth * 0.03, fontWeight: FontWeight.bold, color: Colors.grey)),

                          ],
                        ),

                        AuthenticationTextFieldWidget(title: 'Email', TxtController: context.read<AuthCubit>().emailController, isPassword: false),

                        AuthenticationTextFieldWidget(title: 'Password',TxtController: context.read<AuthCubit>().passwordController, isPassword: true),

                        if(state is AuthFailure)
                          Text(state.error, style: TextStyle(color: Colors.red, fontSize: deviceinfo.screenWidth * 0.035, fontWeight: FontWeight.bold)),

                        const Spacer(),

                        Container(
                          height: deviceinfo.screenHeight * 0.06,
                          width: deviceinfo.screenWidth * 0.6,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.05), color: ColorsManager.buttonColor),
                          child: MaterialButton(
                            onPressed: state is AuthLoading
                                ? null: (){
                              // context.pushNamed(Routes.homePage);
                              context.read<AuthCubit>().login();



                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.05)),
                            child:
                            state is AuthLoading
                                ? const CircularProgressIndicator()
                                :
                            Text("Login", style: TextStyle(color: Colors.black, fontSize: deviceinfo.screenWidth * 0.04, fontWeight: FontWeight.bold)),
                          ),
                        ),


                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(color: Colors.black, fontSize: deviceinfo.screenWidth * 0.04, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " Sign up",
                                recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(Routes.signUpScreen),
                                style: TextStyle(color: ColorsManager.buttonColor, fontSize: deviceinfo.screenWidth * 0.04, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}