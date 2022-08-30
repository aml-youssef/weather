import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseWeatherLocalDataSourse {
  bool getAppMode();
  Future<void> setAppMode(bool isDark);
}

class WeatherLocalDataSourse implements BaseWeatherLocalDataSourse {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourse(this.sharedPreferences);

  @override
  Future<void> setAppMode(bool isDark) async {
    await sharedPreferences.setBool('mood', isDark);
  }

  @override
  bool getAppMode() {
    bool? mood = sharedPreferences.getBool('mood');
    if (mood == null) {
      return false; //throw CacheExeptions(errorMessege: 'there is no cached data');
    } else {
      return mood;
    }
  }
}
