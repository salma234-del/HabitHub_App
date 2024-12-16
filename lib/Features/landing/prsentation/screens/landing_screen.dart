import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            landingBackgroundImage,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 73,
                ),
                Text(
                  'Do your\n tasks\n quickly\n and easy',
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'Your tasks, your rules, our support.',
                  style: AppTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 99,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.login);
                  },
                  child: const Text('Login'),
                )),
                const SizedBox(height: 8),
                Center(
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.register);
                    },
                    child: Text(
                      'Create an account',
                      style: AppTextStyles.bodySmall.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                // const ORDivider(),
                // const SizedBox(
                //   height: 20,
                // ),
                // const SocialLogin(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
