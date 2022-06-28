
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/partners_cubit/PartnersStates.dart';

import '../../Models/PartnersModel.dart';

import '../../database/remote/dio_exceptions.dart';
import '../../view/pages/dioHelper.dart';

class PartnersCubit extends Cubit<PartnersStates> {
  PartnersCubit() : super(InitPartnersState());

  static PartnersCubit get(context) => BlocProvider.of(context);

 PartnersModel? partnersModel;

  Future<dynamic> getNews() async {
    emit(GetPartnersDetailsLoading());
    partnersModel = null;
    try {
      final response = await DioHelper.getData(
          url: 'partner',
          token:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInJvbGUiOjQsImlhdCI6MTY1NjMzNjEzMSwiZXhwIjoxNzQyNzM2MTMxfQ.TBNfR67rsTid8gADUTMunUcZEZEvgOaGqaOHdZL25os");

      partnersModel = PartnersModel.fromJson(response.data);

      //showToast(message: categoriesModel!.message!);
      emit(GetPartnersDetailsSuccess());
      return partnersModel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(GetPartnersDetailsError(errorMessage));
      throw errorMessage;
    }
  }
}
