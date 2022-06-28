import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/Models/NewsModel.dart';
import 'package:testmahmoud/ViewModel/news_cuibt/NewsState.dart';
import 'package:testmahmoud/view/pages/dioHelper.dart';

import '../../database/remote/dio_exceptions.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? news;

  Future<dynamic> getNews() async {
    emit(GetNewsDetailsLoading());
    news = null;
    try {
      final response = await DioHelper.getData(
          url: 'news',
          token:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInJvbGUiOjQsImlhdCI6MTY1NjMzNjEzMSwiZXhwIjoxNzQyNzM2MTMxfQ.TBNfR67rsTid8gADUTMunUcZEZEvgOaGqaOHdZL25os");

      news = NewsModel.fromJson(response.data);

      //showToast(message: categoriesModel!.message!);
      emit(GetNewsDetailsSuccess());
      return news;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(GetNewsDetailsError(errorMessage));
      throw errorMessage;
    }
  }
}
