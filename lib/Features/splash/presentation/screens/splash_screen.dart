import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // transition to the next screen after 3 seconds
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouter.onboarding);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(splashLogo),
      ),
    );
  }
}
