
abstract class NewsStates{}

class InitNewsState extends NewsStates{}
class GetNewsDetailsLoading extends NewsStates{}
class GetNewsDetailsSuccess extends NewsStates{}
class GetNewsDetailsError extends NewsStates{
  final String error;
  GetNewsDetailsError(this.error);
}
