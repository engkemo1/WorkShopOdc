class LoginModel {
  String? code;
  String? message;
  String? token;
  LoginModel.fromjeson({required Map<String, dynamic> data}) {
    code = data['code'];
    message = data['message'];
    token = data['data']['accessToken'];
  }
}
