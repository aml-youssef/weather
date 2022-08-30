import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/routes/app_routes.dart';
import 'package:weather/core/utlis/media_quiry_values.dart';
import '../controllers/cubit/weather_cubit.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('hightttttttttttttttttttttttt : ${context.hight}');
    // BlocProvider.of<WeatherCubit>(context).getAppMood();
    BlocProvider.of<WeatherCubit>(context).getWeatherByCoordinates().then(
          (value) => Navigator.pushReplacementNamed(
              context, AppRoutes.weatherScreenRoute),
        );
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.cloud_circle_rounded,
          color: Colors.blueGrey,
          size: 144,
        ),
      ),
    );
  }
}

// AlertDialog(
//             actions: [
//               CupertinoDialogAction(
//                 child: Text('Back'),
//                 onPressed: () {
//                   if (Platform.isIOS) {
//                     exit(0);
//                   } else {
//                     SystemNavigator.pop();
//                   }
//                 },
//               ),
//               CupertinoDialogAction(
//                 child: Text('Settings'),
//                 onPressed: () {
//                   Geolocator.openAppSettings();
//                 },
//               ),
//             ],
//           ),
