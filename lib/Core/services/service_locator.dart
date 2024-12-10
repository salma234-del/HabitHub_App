import 'package:get_it/get_it.dart';
import 'package:todo/Features/home/data/data_sources/firebase_firestore_database.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //sl.registerLazySingleton<HomeRepo>(() => LocalVariablesDatabase());
    //sl.registerLazySingleton<HomeRepo>(() => LocalStorageDataBase());
    sl.registerLazySingleton<HomeRepo>(() => FirebaseFirestoreDatabase());
  }
}
