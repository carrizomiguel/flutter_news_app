import 'package:everything_repository/everything_repository.dart';
import 'package:headline_repository/headline_repository.dart';
import 'package:news/bootstrap.dart';
import 'package:news/core/core.dart';
import 'package:source_repository/source_repository.dart';

void main() {
  final sourceRepository = SourceRepository();
  final everythingRepository = EverythingRepository();
  final headlineRepository = HeadlineRepository();

  bootstrap(
    () => AppPage(
      sourceRepository: sourceRepository,
      everythingRepository: everythingRepository,
      headlineRepository: headlineRepository,
    ),
  );
}
