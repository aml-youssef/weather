class ApiEndPoints {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String appKey = '5a50ea5b858912888f6388884900b672';
  // static String weatherNow(String cityName) =>
  //     '$baseUrl/weather?q=$cityName&appid=$appKey';

  static String forecasrWeatherByCityName(String cityName) =>
      '$baseUrl/forecast?q=$cityName&appid=$appKey';

  static String forecasrWeatherByCoordinates(double longitude ,double latitude) =>
      '$baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$appKey';
  
}

//https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=5a50ea5b858912888f6388884900b672

//https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=5a50ea5b858912888f6388884900b672

// https://api.openweathermap.org/data/2.5/forecast?lat=30.0626&lon=31.2497&appid=5a50ea5b858912888f6388884900b672

// 'https://source.unsplash.com/random?monochromatic+dark',
