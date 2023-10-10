import 'dart:io';

import 'package:news_api/news_api.dart';
import 'package:oxidized/oxidized.dart';

/// {@template headline_repository}
/// Top Headlines Repository.
/// {@endtemplate}
class HeadlineRepository {
  /// {@macro headline_repository}
  HeadlineRepository({
    NewsApi? api,
  }) : _api = api ?? NewsApi();

  final NewsApi _api;

  /// Get Headlines
  Future<Result<(int, List<Article>), Failure>> getHeadlines({
    required String category,
    required int page,
  }) async {
    try {
      final remote = await _api.getHeadlines(
        category: category,
        page: page,
      );
      return Result.ok(remote);
    } on RequestException {
      return Result.err(RequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }
}
