import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/bloc_observer.dart';
import 'package:todo/Core/utils/global/theme/theme_data/app_theme.dart';

void main() {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
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
