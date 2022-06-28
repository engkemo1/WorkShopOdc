import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/faq_cuibt/faq_state.dart';
import 'package:testmahmoud/view/pages/dioHelper.dart';

import '../../Models/faq_model.dart';
import '../../database/remote/dio_exceptions.dart';

class FAQ_Cuibt extends Cubit<FAQ_State> {
  FAQ_Cuibt() : super(FAQInitialState());

  static FAQ_Cuibt get(context) => BlocProvider.of(context);
  FAQ? faq;

  getFaq() async {
    emit(FAQLoadingState());
    try {
      final response = await DioHelper.getData(
          url: 'faq',
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInJvbGUiOjQsImlhdCI6MTY1NjMzNjEzMSwiZXhwIjoxNzQyNzM2MTMxfQ.TBNfR67rsTid8gADUTMunUcZEZEvgOaGqaOHdZL25os");

      faq = FAQ.fromJson(response.data);

      //showToast(message: categoriesModel!.message!);
      emit(FAQSuccessState());
      return faq;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(FAQErrorState(errorMessage));
      throw errorMessage;
    }
  }
}
