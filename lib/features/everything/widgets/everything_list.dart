import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/features.dart';
import 'package:news/shared/shared.dart';

class EverythingList extends StatelessWidget {
  const EverythingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EverythingBloc, EverythingState>(
      builder: (context, state) {
        switch (state.status) {
          case EverythingStatus.loading:
            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverList.separated(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ArticleLoader();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            );
          case EverythingStatus.success:
            final articles = state.articles;

            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverList.separated(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final item = articles[index];

                  return ArticleItem(
                    item: item,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            );
          case EverythingStatus.error:
            return const SliverFillRemaining(
              child: Center(
                child: SizedBox.shrink(),
              ),
            );
        }
      },
    );
  }
}
