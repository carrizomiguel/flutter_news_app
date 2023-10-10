import 'package:everything_repository/everything_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headline_repository/headline_repository.dart';
import 'package:news/features/features.dart';
import 'package:source_repository/source_repository.dart';
import 'package:weather/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(
            repository: context.read<SourceRepository>(),
          )..add(HomeSourcesRequested()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => EverythingBloc(
            repository: context.read<EverythingRepository>(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HeadlineBloc(
            repository: context.read<HeadlineRepository>(),
          ),
        ),
      ],
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineBloc = context.read<HeadlineBloc>();
    final everythingBloc = context.read<EverythingBloc>();

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current.status == HomeStatus.success,
      listener: (context, state) {
        everythingBloc.add(EverythingRequested(sources: state.source));
        headlineBloc.add(HeadlineRequested(category: state.category));
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            title: const Text('News'),
            shadowColor: Colors.white,
            actions: const [WeatherInfo()],
            bottom: const HomeTabBar(),
          ),
          body: const HomeTabView(),
        ),
      ),
    );
  }
}
