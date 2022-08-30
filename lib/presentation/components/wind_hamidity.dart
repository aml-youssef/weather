import 'package:flutter/material.dart';
import 'package:weather/core/utlis/constants.dart';

class WingHamidity extends StatelessWidget {
  final int wind;
  final int hamiddity;
  const WingHamidity({Key? key, required this.wind, required this.hamiddity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.only(bottom: 24, left: 12, right: 12, top: 12),
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.wind_power_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    AppConstants.wind,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$wind km/h',
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
                child: VerticalDivider(
                  width: 0,
                  thickness: 1,
                  indent: 10,
                  endIndent: 0,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.water_drop_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    AppConstants.hamidity,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$hamiddity %',
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
