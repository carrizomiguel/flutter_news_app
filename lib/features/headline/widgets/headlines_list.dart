import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/features.dart';
import 'package:news/shared/shared.dart';

class HeadlinesList extends StatelessWidget {
  const HeadlinesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadlineBloc, HeadlineState>(
      builder: (context, state) {
        switch (state.status) {
          case HeadlineStatus.loading:
            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverList.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const LatestLoader();
                  }

                  return const ArticleLoader();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            );
          case HeadlineStatus.success:
            final articles = state.articles;

            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverList.separated(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final item = articles[index];

                  if (index == 0) {
                    return LatestItem(
                      item: item,
                    );
                  }

                  return ArticleItem(
                    item: item,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            );
          case HeadlineStatus.error:
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
