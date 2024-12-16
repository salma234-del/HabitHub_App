import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:todo/Features/auth/presentation/cubits/register_cubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Register success!, please verify your email before login'),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).push(AppRouter.login);
        } else if (state is RegisterLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppText.fullName,
                controller: cubit.fullNameController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppText.email,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppText.password,
                controller: cubit.passwordController,
              ),
              const SizedBox(height: 81),
              ElevatedButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                  }
                },
                child: const Text(AppText.register),
              ),
            ],
          ),
        );
      },
    );
  }
}
