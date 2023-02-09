import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/remote/dio_logging.dart';
import '../data/remote/food_api.dart';
import '../data/repository/food_repository.dart';
import '../data/repository/food_repository_impl.dart';

final sl = GetIt.instance;

void initLocator() {
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://playground-rest-api-vk3y7f3hta-et.a.run.app',
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ))
        ..interceptors.add(sl()));
  sl.registerLazySingleton<FoodApi>(() => FoodApi(api: sl()));
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(api: sl()));
  sl.registerFactory<Interceptor>(() => Logging());
}
