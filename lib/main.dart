import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/global/theme/theme_data/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Subul TO DO App',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
