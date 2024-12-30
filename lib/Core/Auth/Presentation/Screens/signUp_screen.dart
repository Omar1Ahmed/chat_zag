import 'package:chat_zag/Helpers/extantions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../routing/routs.dart';
import '../../../../Responsive/ui_component/info_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../Logic/auth_cubit.dart';
import '../Widgets/AuthenteicationTextFieldWidget.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget(
        builder: ( context, deviceinfo) {
          return SingleChildScrollView(
            child: Container(
              height: deviceinfo.screenHeight,
              width: deviceinfo.screenWidth,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: deviceinfo.screenWidth * 0.05, end: deviceinfo.screenWidth * 0.05, top: deviceinfo.screenHeight * 0.08, bottom: deviceinfo.screenHeight * 0.04),
                child: BlocConsumer<AuthCubit, AuthState>( listener: (context, state) {
                  if (state is AuthSuccess) {
                    context.pushNamed(Routes.homePage);
                  }
                },
                    builder: (context, state) {

                      return Column(
                        spacing: deviceinfo.screenHeight * 0.025,

                        children: [

                          Column(
                            children: [
                              Text("Create Account", style: TextStyle(fontSize: deviceinfo.screenWidth * 0.07, fontWeight: FontWeight.bold, color: Colors.black)),
                              Text("join our community", style: TextStyle(fontSize: deviceinfo.screenWidth * 0.03, fontWeight: FontWeight.bold, color: Colors.grey)),
                            ],
                          ),

                          AuthenticationTextFieldWidget(title: 'Email',TxtController: context.read<AuthCubit>().emailController, isPassword: false),

                          AuthenticationTextFieldWidget(title: 'First Name',TxtController: context.read<AuthCubit>().firstNameController, isPassword: false),

                          AuthenticationTextFieldWidget(title: 'last Name',TxtController: context.read<AuthCubit>().lastNameController, isPassword: false),

                          AuthenticationTextFieldWidget(title: 'Password' ,TxtController: context.read<AuthCubit>().passwordController, isPassword: true),

                          AuthenticationTextFieldWidget(title: 'Rewrite Password',TxtController: context.read<AuthCubit>().RewritePassController, isPassword: true),


                          if(state is AuthFailure)
                            Text(state.error, style: TextStyle(color: Colors.red, fontSize: deviceinfo.screenWidth * 0.035, fontWeight: FontWeight.bold)),

                          const Spacer(),

                          Container(
                            height: deviceinfo.screenHeight * 0.06,
                            width: deviceinfo.screenWidth * 0.6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.05), color: ColorsManager.buttonColor),
                            child: MaterialButton(
                              onPressed: state is AuthLoading
                                  ? null: () {
                                context.read<AuthCubit>().signup();
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.05)),
                              child: state is AuthLoading
                                  ?CircularProgressIndicator(color: Colors.white)
                                  : Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: deviceinfo.screenWidth * 0.04, fontWeight: FontWeight.bold)),
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Have an account? ",
                                  style: TextStyles.richTextBoldWhite.copyWith(fontSize: deviceinfo.screenWidth * 0.04, color: Colors.black),
                                ),
                                TextSpan(
                                    text: "Sign in",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushReplacementNamed(Routes.loginScreen);
                                      },
                                    style: TextStyles.richTextBoldButtonColor.copyWith(fontSize: deviceinfo.screenWidth * 0.04))
                              ],
                            ),
                          ),

                        ],
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}