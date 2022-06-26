import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/endpoints.dart';
import 'package:testmahmoud/ViewModel/login_cubit/LoginState.dart';
import 'package:testmahmoud/Views/Component/catchError.dart';
import 'package:testmahmoud/Views/Pages/Login.dart';
import 'package:testmahmoud/database/remote/dioHelper.dart';
import 'package:testmahmoud/database/remote/dio_exceptions.dart';
import 'package:testmahmoud/database/remote/dio_exceptions.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Intistate());
  static LoginCubit GetInstence(context) => BlocProvider.of(context);

  Login({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      await DioHelper.PostData(url: login, data: data).then((value) {
        emit(LoginSuccess());
      });
      return true;
    } on DioError catch (e) {
      emit(LoginError(e));

      return CatchError(e);
    }
  }
}
