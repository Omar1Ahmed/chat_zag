import 'package:bloc/bloc.dart';
import 'package:chat_zag/Core/Auth/Models/AuthModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../Helpers/ApiError.dart';
import '../../../Helpers/Notifications/notification_cubit.dart';
import '../../../Helpers/dioHelper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController RewritePassController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  String? fbToken;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }

  // Fake login method
  Future<void> login() async {

    emit(AuthFailure(''));
    emit(AuthLoading());
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){

      try {

        print(NotificationInitial.token);

        final response = await DioHelper.postData(url: '/api/auth/login',
        data: {'email': emailController.text, 'password': passwordController.text,
          'fb_token': NotificationInitial.token ?? ' '
        });

        print(response.data);

        AuthModel authModel = authModelFromJson(response.data);

        if(authModel.token != null){
          emit(AuthSuccess());

        }else{
          print(response.data);
          ErrorModel errorModel = errorModelFromJson(response.data);
          emit(AuthFailure(errorModel.error.toString()));
        }
        // emit(AuthSuccess());


      } catch (e) {
        print(e);
        if(e is DioException){
        print(e);
        print('----------');
        print(e.response.toString());
        print('----------');
        print(e.response!.data);

          ErrorModel errorModel = errorModelFromJson(e.response!.data);

          emit(AuthFailure(errorModel.message.toString()));
        }else{

        print(e.toString());
          emit(AuthFailure(e.toString()));
        }

      }
    }else{
      emit(AuthFailure('Fill All Fields'));
    }
  }

  // Fake signup method
  Future<void> signup() async {

    emit(AuthFailure(''));
    emit(AuthLoading());
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty && firstNameController.text.isNotEmpty&& RewritePassController.text.isNotEmpty && lastNameController.text.isNotEmpty){
      if(passwordController.text == RewritePassController.text){

        try {

          print(NotificationInitial.token);

          final response = await DioHelper.postData(url: '/api/auth/register',
              data: {'email': emailController.text, 'password': passwordController.text,
                'first_name': firstNameController.text,
                'last_name': lastNameController.text,
                'fb_token': NotificationInitial.token ?? ' ',
              });

          print(response.data);

          AuthModel authModel = authModelFromJson(response.data);

          if(authModel.token != null){
            emit(AuthSuccess());

          }else{
            print(response.data);
            ErrorModel errorModel = errorModelFromJson(response.data);
            emit(AuthFailure(errorModel.error.toString()));
          }
          // emit(AuthSuccess());


        } catch (e) {
          print(e);
          if(e is DioException){
            print(e);
            print('----------');
            print(e.response.toString());
            print('----------');
            print(e.response?.data);

            ErrorModel errorModel = errorModelFromJson(e.response?.data);

            emit(AuthFailure(errorModel.message.toString()));
          }else{

            print(e.toString());
            emit(AuthFailure(e.toString()));
          }

        }
      }else{
        emit(AuthFailure('Passwords are not the same'));

      }
    }else{
      emit(AuthFailure('Fill All Fields'));
    }
  }
}