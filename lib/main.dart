import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/themes/theme_data_light.dart';
import 'package:weather/core/utlis/constants.dart';
import 'package:weather/presentation/controllers/cubit/app_moode_cubit.dart';
import 'package:weather/presentation/controllers/cubit/weather_cubit.dart';
import 'package:weather/presentation/screens/splash_screen.dart';
import 'package:weather/service_locator.dart';
import 'bloc_observer.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/therm_data_dark.dart';

void main() async {
  ServiceLocator().init();
  Bloc.observer = AppBlocObserver();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(
        create: (context) => sl<WeatherCubit>(), 
      ),
      BlocProvider(
        create: (context) => AppMoodeCubit()..getAppMood(), 
      ),
      ],
      child: BlocBuilder<AppMoodeCubit, AppMoodeState>(
        builder: (context, state) {
          return MaterialApp(
              title: AppConstants.appTitle,
              theme: appLightTheme(),
              darkTheme: AppDarkTheme(),
              themeMode: BlocProvider.of<AppMoodeCubit>(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SpalshScreen(),
              routes: routes,
              debugShowCheckedModeBanner: false,
            );
        }
      ),
    );
  }
}
