import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:todo/Features/auth/presentation/cubits/login_cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login success!'),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).go(AppRouter.layout);
        } else if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppText.email,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppText.password,
                controller: cubit.passwordController,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.resetPassword);
                  },
                  child: const Text(AppText.forgotPassword),
                ),
              ),
              const SizedBox(height: 81),
              ElevatedButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login();
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                  }
                },
                child: const Text(AppText.loginButton),
              ),
            ],
          ),
        );
      },
    );
  }
}
