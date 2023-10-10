import 'dart:io';

import 'package:news_api/news_api.dart';
import 'package:oxidized/oxidized.dart';

/// {@template everything_repository}
/// Everything Repository.
/// {@endtemplate}
class EverythingRepository {
  /// {@macro everything_repository}
  EverythingRepository({
    NewsApi? api,
  }) : _api = api ?? NewsApi();

  final NewsApi _api;

  /// Get Everything
  Future<Result<(int, List<Article>), Failure>> getEverything({
    required String from,
    required String to,
    required String sources,
    required int page,
  }) async {
    try {
      final remote = await _api.getEverything(
        from: from,
        to: to,
        sources: sources,
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
