import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/auth/presentation/cubits/forget_pass_cubit/reset_pass_cubit.dart';
import 'package:todo/Features/auth/presentation/cubits/forget_pass_cubit/reset_pass_state.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassCubit, ResetPassState>(
      listener: (context, state) {
        if (state is ResetPassFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ResetPassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Reset password success!, please check your email to reset password'),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).pushReplacement(AppRouter.login);
        } else if (state is ResetPassLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ResetPassCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppText.email,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 81),
              ElevatedButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.resetPassword();
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                  }
                },
                child: const Text(AppText.resetPassword),
              ),
            ],
          ),
        );
      },
    );
  }
}
