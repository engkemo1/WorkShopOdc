class TermsModel{
  String? code;
 var terms;
  TermsModel.fromjeson({required Map<String,dynamic>data}){
    code=data['code'];
    terms=data['data']['Terms'];
  }
}