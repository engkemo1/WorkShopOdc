
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/faq_cuibt/faq_state.dart';

class FAQ_Cuibt  extends Cubit<FAQ_State>{
  FAQ_Cuibt():super(FAQInitialState());
  static FAQ_Cuibt get(context)=>BlocProvider.of(context);





}