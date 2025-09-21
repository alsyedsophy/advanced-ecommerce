import 'package:advanced_ecommerce/services/auth_service.dart';
import 'package:advanced_ecommerce/services/cart_service.dart';
import 'package:advanced_ecommerce/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthServiceImpl());
  locator.registerLazySingleton(() => FirestoreService.instance);
  locator.registerLazySingleton(() => CartService());
}
