import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppText.email,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.password,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 81),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.layout);
            },
            child: const Text(AppText.loginButton),
          ),
        ],
      ),
    );
  }
}
