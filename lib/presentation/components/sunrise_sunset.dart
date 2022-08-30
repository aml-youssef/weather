import 'package:flutter/material.dart';
import 'package:weather/core/utlis/constants.dart';

class SunriseSunset extends StatelessWidget {
  final String sunrise;
  final String sunset;
  const SunriseSunset({Key? key, required this.sunrise, required this.sunset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   const Text(
                    AppConstants.sunrise,
                  ),
                  Text(
                    sunrise,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                   const Text(
                    AppConstants.sunset,
                  ),
                  Text(
                    sunset,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

