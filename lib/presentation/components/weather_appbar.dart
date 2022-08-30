import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/utlis/media_quiry_values.dart';
import 'package:weather/domain/entities/weather.dart';

class WeatherAppBar extends StatelessWidget {
  final Weather weather;
  const WeatherAppBar({Key? key, required this.weather}) : super(key: key);

  // void test (){
  //   Timer.periodic(const Duration(seconds: 2), (timer) { })
  // }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.hight * 0.43,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 44, bottom: 16),
        background: Padding(
          padding: const EdgeInsets.only(left: 40, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${weather.temperature}°',
                      style: const TextStyle(fontSize: 60)),
                  Icon(
                    Icons.sunny,
                    size: 72,
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                  '${weather.todayForecastWeather[0].maxTemperature} / ${weather.todayForecastWeather[0].minTemperature}° Feels Like ${weather.feelsLikeTemperature}°'),
              Text(DateFormat('EEE, h:mm a').format(DateTime.now())),
            ],
          ),
        ),
        title: Row(
          children: [
            Text(
              weather.cityName.toUpperCase(),
              softWrap: true,
            ),
            const Icon(
              Icons.location_on,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
