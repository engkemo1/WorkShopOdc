abstract class SignupState {}

class intiStateSignup extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupError extends SignupState {
  final error;
  SignupError(this.error);
}

class UniversityLoading extends SignupState {}

class UniversitySuccess extends SignupState {}

class UniversityError extends SignupState {
  final error;
  UniversityError(this.error);
}

class ChangeUniversitySuccess extends SignupState {}

class ChangeGenderSuccess extends SignupState {}

class ChangeGradeSuccess extends SignupState {}
