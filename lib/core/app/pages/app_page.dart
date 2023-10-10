import 'package:everything_repository/everything_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headline_repository/headline_repository.dart';
import 'package:news/features/home/home.dart';
import 'package:source_repository/source_repository.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required SourceRepository sourceRepository,
    required EverythingRepository everythingRepository,
    required HeadlineRepository headlineRepository,
    super.key,
  })  : _sourceRepository = sourceRepository,
        _everythingRepository = everythingRepository,
        _headlineRepository = headlineRepository;

  final SourceRepository _sourceRepository;
  final EverythingRepository _everythingRepository;
  final HeadlineRepository _headlineRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _sourceRepository),
        RepositoryProvider.value(value: _everythingRepository),
        RepositoryProvider.value(value: _headlineRepository),
      ],
      child: const AppBody(),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
