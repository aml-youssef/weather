import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/base_weather_repository.dart';
import '../datasource/remote_datasource.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  // final BaseWeatherLocalDataSourse baseWeatherLocalDataSourse;

  WeatherRepository(this.baseRemoteDataSource,);

  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName) async {
    dynamic result;
    try {
      result = await baseRemoteDataSource.getWeatherByCountryName(cityName);
      return Right(result);
    } on ServerExeption {
      return Left(ServerFailure(
          errorMessegeModel: (result as ServerExeption).errorMessegeModel));
    } on IntenetConnectionException {
      return Left(IntenetConnectionFailure(
          errorMessegeModel: (result as ServerExeption).errorMessegeModel));
    }
  }

  @override
  Future<Either<Failure, Weather>> getWeatherBycoordinates() async {
    dynamic result;
    try {
      result = await baseRemoteDataSource.getWeatherByCoordinates();
      return Right(result);
    } on ServerExeption {
      return Left(ServerFailure(
          errorMessegeModel: (result as ServerExeption).errorMessegeModel));
    } on PermissionsExeptions {
      return Left(PermissionFailure(
          errorMessegeModel: (result as PermissionFailure).errorMessegeModel));
    }
  }

  // @override
  // Either<Failure, bool> getAppMode() {
  //   dynamic result;
  //   try {
  //     result = baseWeatherLocalDataSourse.getAppMode();
  //     return Right(result);
  //   } on CacheExeptions {
  //     return Left(CacheFailure(errorMessegeModel: (result as PermissionFailure).errorMessegeModel));
  //   }
  // }

}
