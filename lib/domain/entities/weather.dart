import 'package:equatable/equatable.dart';
import 'package:weather/domain/entities/forecast_weather.dart';

class Weather extends Equatable {
  final int id;
  final String cityName;
  final String sunrise;
  final String sunset;
  final List<ForecastWeather> todayForecastWeather;
  final List<ForecastWeather> weekForecastWeather;
  final int wind;
  final int humidaty;
  final String description;
  final int feelsLikeTemperature;
  final int temperature;
  final String icon;

  const Weather({
    required this.icon,
    required this.temperature,
    required this.feelsLikeTemperature,
    required this.description,
    required this.id,
    required this.todayForecastWeather,
    required this.weekForecastWeather,
    required this.cityName,
    required this.sunrise,
    required this.sunset,
    required this.wind,
    required this.humidaty,
  });

  @override
  List<Object?> get props => [
        feelsLikeTemperature,
        description,
        id,
        cityName,
        sunrise,
        sunset,
        todayForecastWeather,
        weekForecastWeather,
        wind,
        humidaty,
      ];
}
