import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/datasource/local_data_source.dart';
part 'app_moode_state.dart';

class AppMoodeCubit extends Cubit<AppMoodeState> {
  AppMoodeCubit() : super(AppModeInitial());

  bool isDark = false;
  void changeAppMode() async {
    // bool isDark = !getAppMood();
    isDark = !isDark;
    final sharedPreferences = await SharedPreferences.getInstance();
    await WeatherLocalDataSourse(sharedPreferences).setAppMode(isDark);
    if (isDark) {
      emit(WeatherDarkMode());
    } else {
      emit(WeatherLightMode());
    }
  }

  void getAppMood() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    isDark = WeatherLocalDataSourse(sharedPreferences).getAppMode();
    if (isDark) {
      emit(WeatherDarkMode());
    } else {
      emit(WeatherLightMode());
    }
  }
}
