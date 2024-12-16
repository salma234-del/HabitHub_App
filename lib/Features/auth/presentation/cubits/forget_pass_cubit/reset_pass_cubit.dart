// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/auth/data/repos/auth_repo.dart';
import 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  AuthRepo authRepo;

  ResetPassCubit(
    this.authRepo,
  ) : super(ResetPassInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ResetPassChangeAutovalidateMode());
  }

  Future<void> resetPassword() async {
    emit(ResetPassLoading());
    final result = await authRepo.resetPassword(email: emailController.text);
    result.fold(
        (failure) => emit(ResetPassFailure(errorMessage: failure.errorMessage)),
        (success) => emit(ResetPassSuccess()));
  }
}
