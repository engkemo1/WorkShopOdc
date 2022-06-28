import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/Terms_Cubit/TermsState.dart';
import 'package:testmahmoud/Views/Component/catchError.dart';

import '../../Models/TermsModel.dart';
import '../../view/pages/dioHelper.dart';
import '../endpoints.dart';

class TermsCubit extends Cubit<TermsState>{
  TermsCubit():super(TermsInit());

  static TermsCubit GetInstance(context)=>BlocProvider.of(context);
  TermsModel? termsModel;
  GetTerms()async {
    emit(TermsLoading());
    try {
      await DioHelper.getData(url: terms).then((value) {
        emit(TermsSuccess());
        termsModel=TermsModel.fromjeson(data: value.data);


      });
    }on DioError catch (error) {

      return CatchError(error);
    }
  }
}