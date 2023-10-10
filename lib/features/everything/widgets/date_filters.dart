import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news/features/features.dart';
import 'package:news/shared/shared.dart';

class DateFilters extends StatelessWidget {
  const DateFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final everythingBloc = context.read<EverythingBloc>();

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<EverythingBloc, EverythingState>(
          builder: (context, state) {
            switch (state.status) {
              case EverythingStatus.loading:
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ShimmerLoading(
                        height: 30,
                        width: null,
                        borderRadius: 10,
                      ),
                    ),
                    ShimmerLoading(
                      height: 30,
                      width: 60,
                      borderRadius: 10,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                    Expanded(
                      child: ShimmerLoading(
                        height: 30,
                        width: null,
                        borderRadius: 10,
                      ),
                    ),
                  ],
                );
              case EverythingStatus.success:
                final from = state.dateRange.$1;
                final to = state.dateRange.$2;

                return BlocSelector<HomeBloc, HomeState, String>(
                  selector: (state) => state.source,
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        final date = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                          initialDateRange: DateTimeRange(
                            start: from,
                            end: to,
                          ),
                        );
                        if (date != null) {
                          everythingBloc.add(
                            EverythingRequested(
                              sources: state,
                              from: date.start,
                              to: date.end,
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _DateContainer(
                            date: from!,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: const Icon(
                              Icons.compare_arrows_rounded,
                              color: Colors.black,
                            ),
                          ),
                          _DateContainer(
                            date: to!,
                          ),
                        ],
                      ),
                    );
                  },
                );
              case EverythingStatus.error:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _DateContainer extends StatelessWidget {
  const _DateContainer({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            DateFormat(
              'dd/MM/yyyy',
            ).format(date),
          ),
        ),
      ),
    );
  }
}
