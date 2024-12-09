import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/bloc_observer.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Core/utils/global/theme/theme_data/app_theme.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(tasksCategoriesBox);
  Hive.registerAdapter(TaskCategoryModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
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
