import 'package:dartz/dartz.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/domain/repositories/base_weather_repository.dart';
import '../../core/error/failure.dart';
import '../entities/weather.dart';

class GetWeatherByCoordinatesUsecase
    implements BaseUsecase<Weather, NoParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCoordinatesUsecase({required this.baseWeatherRepository});

  @override
  Future<Either<Failure, Weather>> call(NoParameters parameters) async {
    return await baseWeatherRepository.getWeatherBycoordinates();
  }
}
