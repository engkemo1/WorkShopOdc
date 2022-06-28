
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/endpoints.dart';
import 'package:testmahmoud/ViewModel/login_cubit/LoginState.dart';
import 'package:testmahmoud/Views/Component/catchError.dart';
import 'package:testmahmoud/database/local/cache_helper.dart';
import '../../Models/LoginModel.dart';
import '../../view/pages/dioHelper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Intistate());

  static LoginCubit GetInstence(context) => BlocProvider.of(context);
  LoginModel?    model;

  Login({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      await DioHelper.PostData(url: login, data: data).then((value) {
        model=LoginModel.fromjeson(data: value.data);
        emit(LoginSuccess());

      });
      return true;
    } on DioError catch (e) {
      emit(LoginError(e));

      return CatchError(e);
    }
  }


}
