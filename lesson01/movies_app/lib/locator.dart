import 'package:get_it/get_it.dart';
import 'package:movies_app/services/ApiService.dart';
import 'package:movies_app/services/MovieService.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MovieService());
  locator.registerLazySingleton(() => APIService());
  locator.registerLazySingleton(() => NavigationService());
}
