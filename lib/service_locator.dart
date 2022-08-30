import 'package:get_it/get_it.dart';
import 'package:weather/data/datasource/remote_datasource.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/domain/repositories/base_weather_repository.dart';
import 'package:weather/domain/usecase/get_weather_by_coordenates.dart';
import 'package:weather/domain/usecase/get_weather_by_country_name.dart';
import 'package:weather/presentation/controllers/cubit/weather_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => WeatherCubit(
        getWeatherByCityNameUsecase: sl(),
        getWeatherByCoordinatesUsecase: sl()));

    //usecase
    sl.registerLazySingleton(() => GetWeatherByCityNameUsecase(sl()));
    sl.registerLazySingleton(() => GetWeatherByCoordinatesUsecase(baseWeatherRepository: sl()));

    //repository

    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));

    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
