import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/Models/SignupModel.dart';
import 'package:testmahmoud/Models/universityModel.dart';
import 'package:testmahmoud/ViewModel/endpoints.dart';
import 'package:testmahmoud/ViewModel/signup_cubit/SignUpState.dart';
import 'package:testmahmoud/Views/Component/catchError.dart';
import 'package:testmahmoud/database/remote/dioHelper.dart';
import 'package:testmahmoud/database/remote/dio_exceptions.dart';

import '../../Models/ModelUniversity.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(intiStateSignup());

  static SignupCubit GetInstence(context) => BlocProvider.of(context);
  SignUpModel? Model;
  UniversityModel? universityModel;
  String University = "";
  String gender = "m";
  String grade = "1";

  SignUp({required Map<String, dynamic> data}) async {
    emit(SignupLoading());

    try {
      await DioHelper.PostData(url: Signup, data: data).then((value) {
        emit(SignupSuccess());
        Model = SignUpModel.fromjeson(data: value.data);
      });
      return true;
    } on DioError catch (e) {
      emit(SignupError(e));
      return CatchError(e);
    }
  }

  GetAllUniversities() async {
    emit(UniversityLoading());
    try {
      await DioHelper.GetData(url: university).then((value) {
        emit(UniversitySuccess());
        universityModel = UniversityModel.fromjeson(data: value.data);
        University = universityModel!.universityData[0].id.toString();
      });
    } on DioError catch (e) {
      return CatchError(e);
    }
  }

  ChangeUniversity(val) {
    University = val;
    emit(ChangeUniversitySuccess());
  }

  ChangeGender(val) {
    gender = val;
    emit(ChangeGenderSuccess());
  }

  ChangeGrade(val) {
    grade = val;
    emit(ChangeGradeSuccess());
  }
}
