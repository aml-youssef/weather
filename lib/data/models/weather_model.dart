import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain/entities/weather.dart';
import '../../domain/entities/forecast_weather.dart';
import 'forecast_weather_model.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.icon,
    required super.temperature,
    required super.feelsLikeTemperature,
    required super.description,
    required super.id,
    required super.todayForecastWeather,
    required super.weekForecastWeather,
    required super.cityName,
    required super.sunrise,
    required super.sunset,
    required super.wind,
    required super.humidaty,
  });

  factory WeatherModel.fromJason(Map<String, dynamic> json) {
    return WeatherModel(
      temperature:
          ForecastWeatherModel.toCelsius((json['list'][0]['main']['temp']).toDouble()),
      icon: json['list'][0]['weather'][0]['icon'],
      feelsLikeTemperature:
          ForecastWeatherModel.toCelsius(json['list'][0]['main']['feels_like']),
      description: json['list'][0]['weather'][0]['description'],
      id: json['city']['id'],
      todayForecastWeather: _toodayForecastWeather((json['list'] as List)),
      weekForecastWeather: _weakForecastWeather((json['list'] as List)),
      cityName: json['city']['name'],
      sunrise: timestampToDateTime(json['city']['sunrise']),
      sunset: timestampToDateTime(json['city']['sunset']),
      wind: fromMetertokKeloMeter(json['list'][0]['wind']['speed']),
      humidaty: (json['list'][0]['main']['humidity'] as int).toInt(),
    );
  }

  static List<ForecastWeather> _toodayForecastWeather(List json) {
    List<ForecastWeather> data = List<ForecastWeather>.from(
        json.map((e) => ForecastWeatherModel.fromJson(e)));
    List<ForecastWeather> result = [
      data[0],
    ];
    for (int i = 0; i < data.length; i++) {
      if (data[i].dateTime.day == data[i + 1].dateTime.day) {
        result.add(data[i + 1]);
      } else {
        break;
      }
    }
    debugPrint('_toodayForecastWeather : ${result.toString()}');
    return result;
  }

  static List<ForecastWeather> _weakForecastWeather(List json) {
    List<ForecastWeather> data = List<ForecastWeather>.from(
        json.map((e) => ForecastWeatherModel.fromJson(e)));
    List<ForecastWeather> result = [
      data[0],
    ];
    for (int i = 1; i < data.length;) {
      if (result.last.dateTime.day != data[i].dateTime.day) {
        result.add(data[i]);
        i += 8;
      } else {
        i++;
      }
    }
    debugPrint('_weakForecastWeather : ${result.toString()}');
    return result;
  }

  static String timestampToDateTime(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat.jm().format(date); //6:00 Am
    // return date;
  }

  static int fromMetertokKeloMeter(double mS) {
    return mS ~/ (1000 / 3600);
  }
}




//   static String timeOfDayToString(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     final format = DateFormat.jm(); //"6:00 AM"
//     return format.format(dt);
//   }


//   static TimeOfDay stringToTimeOfDay(String input) {
//     TimeOfDay day;
//     final format = DateFormat.jm(); //"6:00 AM"
//     day = TimeOfDay.fromDateTime(format.parse(input));
//     return day;
//   }


//   static DateTime stringToDateTime(String input) {
//     // DateFormat inputFormat = DateFormat('yyy - MM - dd');
//     return DateTime.parse(input);
//   }


// int toDouble(TimeOfDay myTime) => myTime.hour * 60 + myTime.minute;



// DateTime.now().add(Duration(days: i)).day



//  DateFormat('EEE').format(DateTime.now().add(Duration(days: i)))
