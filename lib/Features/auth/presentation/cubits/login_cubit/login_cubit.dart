import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/auth/data/repos/auth_repo.dart';
import 'package:todo/Features/auth/presentation/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePass = false;
  IconData suffixIcon = Icons.visibility_outlined;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(LoginChangeAutovalidateMode());
  }

  void changeObscurePass() {
    obscurePass = !obscurePass;
    suffixIcon =
        obscurePass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangeObscurePass());
  }

  Future<void> login() async {
    emit(LoginLoading());

    final result = await authRepo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.errorMessage)),
      (user) async {
        if (!user.emailVerified) {
          await authRepo.sendVerifyEmail(email: emailController.text);
          emit(LoginFailure('Please check your email to verify your account.'));
        } else {
          emit(LoginSuccess(user));
        }
      },
    );
  }
}
