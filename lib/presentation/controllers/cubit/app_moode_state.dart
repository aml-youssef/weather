part of 'app_moode_cubit.dart';

abstract class AppMoodeState extends Equatable {
  const AppMoodeState();

  @override
  List<Object> get props => [];
}

class AppModeInitial extends AppMoodeState {}

class WeatherLightMode extends AppMoodeState {}

class WeatherDarkMode extends AppMoodeState {}
