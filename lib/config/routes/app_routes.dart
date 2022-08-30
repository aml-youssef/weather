import 'package:weather/presentation/screens/home_weather_screen.dart';

class AppRoutes {
  // static const String splashScreenRoute = '/';
  static const String weatherScreenRoute = '/RandomQuote';
}

final routes = {
  // AppRoutes.splashScreenRoute: (context) => const SpalshScreen(),
  AppRoutes.weatherScreenRoute: (context) => const WeatherScreen(),
};
