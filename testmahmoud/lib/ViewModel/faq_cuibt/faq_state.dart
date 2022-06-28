
abstract class FAQ_State {


}
class FAQInitialState extends FAQ_State{}

class FAQLoadingState extends FAQ_State{}
class FAQSuccessState extends FAQ_State{}

class FAQErrorState extends FAQ_State{
  FAQErrorState(String errorMessage);
}
