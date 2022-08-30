import 'package:weather/domain/entities/forecast_weather.dart';

class ForecastWeatherModel extends ForecastWeather {
  const ForecastWeatherModel({
    required super.dt,
    required super.maxTemperature,
    required super.minTemperature,
    required super.dateTime,
    required super.clouds,
  });


  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        dt: json['dt'],
        maxTemperature: toCelsius(json['main']['temp_max'].toDouble()),
        minTemperature: toCelsius(json['main']['temp_min'].toDouble()),
        dateTime: DateTime.parse(json['dt_txt']),
        clouds: json['clouds']['all'].toInt(),
      );

  static int toCelsius(double temperature) {
    return (temperature - 273.15).toInt();
  }
}
