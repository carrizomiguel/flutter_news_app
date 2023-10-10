import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oxidized/oxidized.dart';
import 'package:weather/weather.dart';

abstract class WeatherRepository {
  Future<Result<Weather, Failure>> getWeather({
    required String lat,
    required String lon,
  });
}

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    WeatherRemoteDataSource? remoteDataSource,
  }) : _remoteDataSource = remoteDataSource ?? WeatherRemoteDataSourceImpl();

  final WeatherRemoteDataSource _remoteDataSource;
  @override
  Future<Result<Weather, Failure>> getWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final remote = await _remoteDataSource.getWeather(
        lat: lat,
        lon: lon,
      );
      return Result.ok(remote);
    } on SocketException {
      return Result.err(SocketFailure());
    } on DioException catch (_) {
      return Result.err(RequestFailure());
    }
  }
}
