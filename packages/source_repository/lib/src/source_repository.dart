import 'dart:io';

import 'package:news_api/news_api.dart';
import 'package:oxidized/oxidized.dart';

/// {@template source_repository}
/// Source Repository.
/// {@endtemplate}
class SourceRepository {
  /// {@macro source_repository}
  SourceRepository({
    NewsApi? api,
  }) : _api = api ?? NewsApi();

  final NewsApi _api;

  Future<Result<List<Source>, Failure>> getSource() async {
    try {
      final remote = await _api.getSources();
      return Result.ok(remote);
    } on RequestException {
      return Result.err(RequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }
}
