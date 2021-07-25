

import 'package:get_it/get_it.dart';
import 'package:komawo/data/firestore_service.dart';
import 'package:komawo/ui/login/login_viewmodel.dart';
import 'package:komawo/ui/payment/payment_viewmodel.dart';
import 'package:komawo/ui/profile/profile_viewmodel.dart';
import 'package:komawo/ui/register/register_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

// 2
void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<FireStoreService>(() => FireStoreService());

  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
  serviceLocator.registerFactory<ProfileViewModel>(() => ProfileViewModel());
  serviceLocator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  serviceLocator.registerFactory<PaymentViewModel>(() => PaymentViewModel());
}