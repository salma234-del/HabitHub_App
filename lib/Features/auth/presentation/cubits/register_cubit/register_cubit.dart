import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/errors/failure.dart';
import 'package:todo/Features/auth/data/repos/auth_repo.dart';
import 'package:todo/Features/auth/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePass = false;
  IconData suffixIcon = Icons.visibility_outlined;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterChangeAutovalidateMode());
  }

  void changeObscurePass() {
    obscurePass = !obscurePass;
    suffixIcon =
        obscurePass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangeObscurePass());
  }

  Future<void> register() async {
    emit(RegisterLoading());

    final result = await authRepo.signUp(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(RegisterFailure(failure.errorMessage)),
      (user) async {
        final verification = await sendVerificationEmail();
        verification.fold(
          (failure) => emit(RegisterFailure(failure.errorMessage)),
          (user) => emit(RegisterSuccess()),
        );
      },
    );
  }

  Future<Either<Failure, void>> sendVerificationEmail() async {
    final verification =
        await authRepo.sendVerifyEmail(email: emailController.text);
    return verification;
  }
}
