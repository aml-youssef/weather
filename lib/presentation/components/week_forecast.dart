import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/forecast_weather.dart';

class WeekForecast extends StatelessWidget {
  final List<ForecastWeather> weekForecastWeather;
  const WeekForecast({Key? key, required this.weekForecastWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: weekForecastWeather.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(DateFormat('EEEE')
                      .format(weekForecastWeather[index].dateTime)),
                  Text('${weekForecastWeather[index].clouds}%'),
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow,
                  ),
                  const Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.yellow,
                  ),
                  Text('${weekForecastWeather[index].maxTemperature}°'),
                  Text('${weekForecastWeather[index].minTemperature}°'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
