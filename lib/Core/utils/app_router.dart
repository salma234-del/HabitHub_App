import 'package:go_router/go_router.dart';
import 'package:todo/Features/add_task/presentation/screens/add_task_screen.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/layout/presentation/screens/layout_screen.dart';
import 'package:todo/Features/landing/prsentation/screens/landing_screen.dart';
import 'package:todo/Features/auth/presentation/screens/login_screen.dart';
import 'package:todo/Features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:todo/Features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const onboarding = '/onboarding';
  static const String landing = '/landing';
  static const String login = '/login';
  static const String layout = '/layout';
  static const String addTask = '/addTask';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: landing,
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: layout,
        builder: (context, state) => const LayoutScreen(),
      ),
      GoRoute(
          path: addTask,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?; // Nullable cast
            return AddTaskScreen(
              task: extra?['task'] as TaskModel?,
              taskIndex: extra?['taskIndex'] as int?,
            );
          }),
    ],
  );
}
