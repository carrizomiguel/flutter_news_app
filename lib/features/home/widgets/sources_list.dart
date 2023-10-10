import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/features.dart';
import 'package:news/shared/shared.dart';

class SourcesList extends StatelessWidget {
  const SourcesList({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 30.0;

    return CustomSliverDelegate(
      floating: true,
      height: height + 20,
      child: Container(
        height: height,
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        color: Colors.white,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.loading:
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ShimmerLoading(
                      borderRadius: 5,
                      height: height,
                      width: 90,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 5);
                  },
                );
              case HomeStatus.success:
                final sources = state.sources;
                final source = state.source;

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: sources.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = sources[index];

                    return _CategoryItem(
                      id: item.id!,
                      title: item.name,
                      isSelected: source == item.id,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 5);
                  },
                );
              case HomeStatus.error:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.id,
    required this.title,
    required this.isSelected,
  });

  final String id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return GestureDetector(
      onTap: () => homeBloc.add(
        HomeSourceChanged(id: id),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
