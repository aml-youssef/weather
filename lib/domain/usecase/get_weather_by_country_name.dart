import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/core/usecase/usecase.dart';
import '../../core/error/failure.dart';
import '../entities/weather.dart';
import '../repositories/base_weather_repository.dart';

class GetWeatherByCityNameUsecase
    implements BaseUsecase<Weather, WeatherByCountryNameParamtes> {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityNameUsecase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, Weather>> call(
      WeatherByCountryNameParamtes paramter) async {
    return await baseWeatherRepository.getWeatherByCityName(paramter.cityName);
  }
}

class WeatherByCountryNameParamtes extends Equatable {
  final String cityName;

  const WeatherByCountryNameParamtes({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
