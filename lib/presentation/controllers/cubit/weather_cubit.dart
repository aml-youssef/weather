import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/core/network/error_messege_model.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/usecase/get_weather_by_coordenates.dart';
import 'package:weather/domain/usecase/get_weather_by_country_name.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherByCityNameUsecase getWeatherByCityNameUsecase;
  final GetWeatherByCoordinatesUsecase getWeatherByCoordinatesUsecase;
  // final GetAppNoodUsecase getAppNoodUsecase;

  WeatherCubit({
    // required this.getAppNoodUsecase,
    required this.getWeatherByCityNameUsecase,
    required this.getWeatherByCoordinatesUsecase,
  }) : super(WeatherInitial());

  Future<void> getWeatherByCityName(String cityName) async {
    emit(WeatherLoading());
    Either<Failure, Weather> result = await getWeatherByCityNameUsecase(
        WeatherByCountryNameParamtes(cityName: cityName));
    emit(
      result.fold(
          (failure) =>
              WeatherError(errorMessegeModel: failure.errorMessegeModel),
          (data) => WeatherLoaded(weather: data)),
    );
  }

  Future<void> getWeatherByCoordinates() async {
    debugPrint('getWeatherByCoordinates');
    emit(WeatherLoading());
    Either<Failure, Weather> result =
        await getWeatherByCoordinatesUsecase(const NoParameters());
    emit(
      result.fold(
          (failure) =>
              WeatherError(errorMessegeModel: failure.errorMessegeModel),
          (data) => WeatherLoaded(weather: data)),
    );
  }

}
