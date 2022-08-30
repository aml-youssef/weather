import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCityName(
    String cityName,
  );
  Future<Either<Failure, Weather>> getWeatherBycoordinates();
  // Either<Failure, bool> getAppMode();
  // Future<void> setAooMood();
}
