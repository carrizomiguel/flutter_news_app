import 'package:dio/dio.dart';
import 'package:weather/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> getWeather({
    required String lat,
    required String lon,
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  @override
  Future<Weather> getWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.weather,
          {
            'lat': lat,
            'lon': lon,
          },
        ).toString(),
      );
      return Weather.fromJson(response);
    } catch (_) {
      rethrow;
    }
  }
}
