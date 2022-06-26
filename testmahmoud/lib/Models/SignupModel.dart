class SignUpModel {
  String? code;
  String? message;
  DataUser? dataUser;
  SignUpModel.fromjeson({required Map<String, dynamic> data}) {
    code = data['code'];
    message = data['message'];
    dataUser = DataUser.formjeson(data: data['data']);
  }
}

class DataUser {
  String? email;
  String? password;
  String? name;
  String? phoneNumber;
  int? universityId;
  int? gradeId;
  int? roleId;
  DataUser.formjeson({required Map<String, dynamic> data}) {
    email = data['email'];
    password = data['password'];
    name = data['name'];
    phoneNumber = data['phoneNumber'];
    universityId = data['universityId'];
    gradeId = data['gradeId'];
    roleId = data['roleId'];
  }
}
