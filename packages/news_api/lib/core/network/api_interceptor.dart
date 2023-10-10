import 'package:dio/dio.dart';
import 'package:news_api/news_api.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters['pageSize'] = '15';
    options.queryParameters['apiKey'] = Config.key;
    super.onRequest(options, handler);
  }
}
