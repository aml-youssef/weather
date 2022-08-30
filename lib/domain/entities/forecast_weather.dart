import 'package:equatable/equatable.dart';

class ForecastWeather extends Equatable {
  final int dt;
  final int maxTemperature;
  final int minTemperature;
  final DateTime dateTime; //dt_txt
  final int clouds;

  const ForecastWeather({
    required this.dt,
    required this.maxTemperature,
    required this.minTemperature,
    required this.dateTime,
    required this.clouds,
  });

  @override
  List<Object?> get props => [
        dt,
        maxTemperature,
        minTemperature,
        dateTime,
        clouds,
      ];
}
