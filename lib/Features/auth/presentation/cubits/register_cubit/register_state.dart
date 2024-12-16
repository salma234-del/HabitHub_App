abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterChangeAutovalidateMode extends RegisterState {}

class RegisterChangeObscurePass extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}

class RegisterSendVerifyEmailLoading extends RegisterState {}
class RegisterSendVerifyEmailSuccess extends RegisterState {}
class RegisterSendVerifyEmailFailure extends RegisterState {
  final String errorMessage;

  RegisterSendVerifyEmailFailure(this.errorMessage);
}

