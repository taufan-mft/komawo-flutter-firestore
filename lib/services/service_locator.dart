

import 'package:get_it/get_it.dart';
import 'package:komawo/data/firestore_service.dart';
import 'package:komawo/ui/login/login_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

// 2
void setupServiceLocator() {
  serviceLocator.registerLazySingleton<FireStoreService>(() => FireStoreService());

  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
}