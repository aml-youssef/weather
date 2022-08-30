import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/components/sunrise_sunset.dart';
import 'package:weather/presentation/components/weather_appbar.dart';
import 'package:weather/presentation/components/week_forecast.dart';
import 'package:weather/presentation/components/wind_hamidity.dart';
import 'package:weather/presentation/screens/error_screen.dart';
import '../components/app_drawer.dart';
import '../components/day_forecast.dart';
import '../components/today_temp_description.dart';
import '../controllers/cubit/weather_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded ) {
          return RefreshIndicator(
            onRefresh: () => BlocProvider.of<WeatherCubit>(context)
                .getWeatherByCoordinates(),
            child: Scaffold(
              drawer: const AppDrawer(),
              body: CustomScrollView(
                slivers: [
                  WeatherAppBar(weather: state.weather),
                  DayForecast(
                      todayForecastWeather: state.weather.todayForecastWeather),
                  TodayTempDescription(description: state.weather.description),
                  WeekForecast(
                      weekForecastWeather: state.weather.weekForecastWeather),
                  SunriseSunset(
                      sunrise: state.weather.sunrise,
                      sunset: state.weather.sunset),
                  WingHamidity(
                      wind: state.weather.wind,
                      hamiddity: state.weather.humidaty),
                ],
              ),
            ),
          );
        } else if (state is WeatherError) {
          return ErrorScreen(
            messege: state.errorMessegeModel.message,
            onRefresh: () => BlocProvider.of<WeatherCubit>(context)
                .getWeatherByCoordinates(),
          );
        } else{
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

// BlocProvider.of<WeatherCubit>(context).getWeatherByCoordinates(longitude: 0, latitude: 0),
// bottom: PreferredSize(
//   preferredSize: Size.fromHeight(32),
//   child: Container(
//     width: double.maxFinite,
//     // padding: EdgeInsets.all(8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('34° / 24° Feels Like 34°'),
//         Text('sun, 2:55 pm'),
//       ],
//     ),
//   ),
// ),



// CustomScrollView(
//   slivers: [
//     SliverStack(
//       insetOnOverlap: false,
//       children: [
//         SliverPositioned.fill(child: Card()),
//         SliverList(...),
//       ],
//     ),
//   ],
// );



// SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 childCount: 50,
//                 (BuildContext context, int index) {
//                   return Container(
//                     width: 100.0,
//                     child: Text('data'),
//                   );
//                 },
//               ),
//             ),


//canUpdate(oldWidget, newWidget),
