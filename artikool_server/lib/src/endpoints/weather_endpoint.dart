import 'package:artikool_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class WeatherEndpoint extends Endpoint {
  //Fetch Weather Info
  Future<WeatherInfo> getWeatherInfo(Session session, int cityId) async {
    var weatherKey = 'weather-$cityId';

    var weatherInfo = await session.caches.local.get(weatherKey) as WeatherInfo?;
    if (weatherInfo == null) {
      //!Log analytical data
      session.log('city-$cityId', level: LogLevel.info);

      //API call to fetch data
      // try {
      //   await Future.delayed(Duration(seconds: 1));
      // } on Exception catch (e) {
      //   //!Log exceptions
      //   session.log('Weather API Error', exception: e, level: LogLevel.error);
      // }
      //Parsing response to model
      weatherInfo = WeatherInfo(temparature: cityId + 20);
      //Saving the data in cache
      session.caches.local.put(weatherKey, weatherInfo, lifetime: Duration(minutes: 10));
    }
    return weatherInfo;
  }
}
