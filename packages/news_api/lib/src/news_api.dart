import 'package:dio/dio.dart';
import 'package:news_api/news_api.dart';

/// {@template news_api}
/// News Api.
/// {@endtemplate}
class NewsApi {
  /// {@macro news_api}
  NewsApi({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final Dio _dio;

  /// Calls the [Endpoints.everything] endpoint
  Future<List<Source>> getSources() async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.sources,
        ).toString(),
      );
      return List<Source>.from(
        (response['sources'] as List<dynamic>).map(
          (x) => Source.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  /// Calls the [Endpoints.everything] endpoint
  Future<(int, List<Article>)> getEverything({
    required String from,
    required String to,
    required String sources,
    required int page,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.everything,
          {
            'from': from,
            'to': to,
            'sources': sources,
            'page': page.toString(),
          },
        ).toString(),
      );

      final length = response['totalResults'] as int;

      final articles = List<Article>.from(
        (response['articles'] as List<dynamic>).map(
          (x) => Article.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );

      return (length, articles);
    } catch (_) {
      rethrow;
    }
  }

  /// Calls the [Endpoints.headline] endpoint
  Future<(int, List<Article>)> getHeadlines({
    required String category,
    required int page,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.headline,
          {
            'category': category,
            'page': page.toString(),
          },
        ).toString(),
      );

      final length = response['totalResults'] as int;

      final articles = List<Article>.from(
        (response['articles'] as List<dynamic>).map(
          (x) => Article.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );

      return (length, articles);
    } catch (_) {
      rethrow;
    }
  }
}
