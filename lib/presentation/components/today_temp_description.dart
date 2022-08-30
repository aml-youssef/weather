import 'package:flutter/material.dart';
import 'package:weather/core/utlis/constants.dart';

class TodayTempDescription extends StatelessWidget {
  final String description;
  const TodayTempDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                AppConstants.todayTemperature,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}


