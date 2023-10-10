import 'package:dio/dio.dart';
import 'package:weather/weather.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters['appid'] = Config.key;
    options.queryParameters['units'] = Config.units;
    super.onRequest(options, handler);
  }
}
