import 'package:get_it/get_it.dart';
import 'package:todo/Core/services/firebase_auth_service.dart';
import 'package:todo/Features/auth/data/repos/auth_repo.dart';
import 'package:todo/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:todo/Features/home/data/data_sources/firebase_firestore_database.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/profile/data/repos/profile_repo.dart';
import 'package:todo/Features/profile/data/repos/profile_repo_impl.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(FirebaseAuthService()),
    );
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());
    //sl.registerLazySingleton<HomeRepo>(() => LocalVariablesDatabase());
    //sl.registerLazySingleton<HomeRepo>(() => LocalStorageDataBase());
    sl.registerLazySingleton<HomeRepo>(() => FirebaseFirestoreDatabase());
  }
}
