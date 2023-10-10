import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/features.dart';

class HeadlinePage extends StatelessWidget {
  const HeadlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeadlineBody();
  }
}

class HeadlineBody extends StatelessWidget {
  const HeadlineBody({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineBloc = context.read<HeadlineBloc>();

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        final whenSuccess = current.status == HomeStatus.success;
        final whenCategoryChanged = previous.category != current.category;
        return whenSuccess && whenCategoryChanged;
      },
      listener: (context, state) => headlineBloc.add(
        HeadlineRequested(category: state.category),
      ),
      child: const CustomScrollView(
        slivers: [
          CategoriesList(),
          HeadlinesList(),
        ],
      ),
    );
  }
}
