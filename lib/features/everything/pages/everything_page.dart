import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/features.dart';

class EverythingPage extends StatelessWidget {
  const EverythingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EverythingBody();
  }
}

class EverythingBody extends StatelessWidget {
  const EverythingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final everythingBloc = context.read<EverythingBloc>();

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        final whenSuccess = current.status == HomeStatus.success;
        final whenSourceChanged = previous.source != current.source;
        return whenSuccess && whenSourceChanged;
      },
      listener: (context, state) => everythingBloc.add(
        EverythingRequested(sources: state.source),
      ),
      child: const CustomScrollView(
        slivers: [
          SourcesList(),
          DateFilters(),
          EverythingList(),
        ],
      ),
    );
  }
}
