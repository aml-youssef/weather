import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/forecast_weather.dart';

class DayForecast extends StatelessWidget {
  final List<ForecastWeather> todayForecastWeather;

  const DayForecast({Key? key, required this.todayForecastWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 150.0,
        margin: const EdgeInsets.all(12),
        child: Card(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: todayForecastWeather.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('h a')
                        .format(todayForecastWeather[index].dateTime)),
                    Icon(
                      DateFormat('a').format(
                                  todayForecastWeather[index].dateTime).toString() ==
                              'AM'
                          ? Icons.circle_rounded
                          : Icons.dark_mode_rounded,
                      color: Colors.yellow,
                    ),
                    Text('${todayForecastWeather[index].maxTemperature}°'),
                    const SizedBox(height: 40),
                    Text('${todayForecastWeather[index].clouds} %'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
