import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(onboardingBg),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    AppText.onboardingTitle,
                    style: AppTextStyles.text24_900,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'I will\n\n☀️ Plan tasks.\n🎯 Set goals.\n🚶‍♂️ Take breaks.\n💪 Move and refresh.\n📝 Prioritize.\n🔍 Break tasks down.\n🚫 No multitasking.\n📵 Minimize distractions.\n⏰ Limit social media.',
                    style: AppTextStyles.text20_400,
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.landing);
                    },
                    child: const Text(AppText.agree),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
