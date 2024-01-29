import 'package:get_it/get_it.dart';

import '../../features/home_feature/data/datasources/home_datasource.dart';
import '../../features/home_feature/data/repo/home_repo.dart';
import 'dio_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioServices());
  locator.registerLazySingleton(() => HomeRepo(locator<HomeDataSource>()));
  locator.registerLazySingleton(() => HomeDataSource(locator<DioServices>()));
}
