abstract class PartnersStates{}

class InitPartnersState extends PartnersStates{}
class GetPartnersDetailsLoading extends PartnersStates{}
class GetPartnersDetailsSuccess extends PartnersStates{}
class GetPartnersDetailsError extends PartnersStates{
  final String error;
  GetPartnersDetailsError(this.error);
}
