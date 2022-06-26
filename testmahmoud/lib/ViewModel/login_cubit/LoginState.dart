abstract class LoginState {}

class Intistate extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final error;
  LoginError(this.error);
}
