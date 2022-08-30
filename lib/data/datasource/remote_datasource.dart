import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/network/error_messege_model.dart';
import '../../core/network/api_end_points.dart';
import '../models/weather_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCountryName(String cityName);
  Future<WeatherModel> getWeatherByCoordinates();
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByCountryName(String cityName) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      var response =
          await Dio().get(ApiEndPoints.forecasrWeatherByCityName(cityName));
      if (response.statusCode == 200) {
        return WeatherModel.fromJason(response.data);
      } else {
        throw ServerExeption(
            errorMessegeModel: ErrorMessegeModel.fromJson(response.data));
      }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<WeatherModel> getWeatherByCoordinates() async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      Position position = await _determinePosition();
      var response = await Dio().get(ApiEndPoints.forecasrWeatherByCoordinates(
          position.longitude, position.latitude));
      if (response.statusCode == 200) {
        return WeatherModel.fromJason(response.data);
      } else {
        throw ServerExeption(
            errorMessegeModel: ErrorMessegeModel.fromJson(response.data));
      }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  Future<bool> get _isConnected async =>
      await InternetConnectionChecker().hasConnection;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //return Future.error('Location services are disabled.');
      throw PermissionsExeptions(
          errorMessege: 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Future.error('Location permissions are denied');
        throw PermissionsExeptions(
            errorMessege: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // Geolocator.openLocationSettings();
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
      throw PermissionsExeptions(
          errorMessege:
              'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
