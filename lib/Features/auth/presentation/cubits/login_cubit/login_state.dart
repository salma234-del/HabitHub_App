import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangeAutovalidateMode extends LoginState {}

class LoginChangeObscurePass extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User? user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  LoginFailure(this.errorMessage);

  final String errorMessage;
}
