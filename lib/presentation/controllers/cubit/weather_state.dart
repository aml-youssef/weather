part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final ErrorMessegeModel errorMessegeModel;

  const WeatherError({required this.errorMessegeModel});

  @override
  List<Object> get props => [errorMessegeModel];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];

}
