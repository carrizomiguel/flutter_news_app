import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api/news_api.dart';
import 'package:source_repository/source_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.repository,
  }) : super(const HomeState()) {
    on<HomeSourcesRequested>(_onSourcesRequested);
    on<HomeSourceChanged>(_onSourceChanged);
    on<HomeCategoryChanged>(_onCategoryChanged);
  }

  final SourceRepository repository;

  Future<void> _onSourcesRequested(
    HomeSourcesRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );
    final result = await repository.getSource();
    result.when(
      ok: (sources) {
        final categories = LinkedHashSet<String>.from(
          sources.map((e) => e.category),
        ).toList();
        emit(
          state.copyWith(
            source: sources.first.id,
            sources: sources,
            category: categories.first,
            categories: categories,
            status: HomeStatus.success,
          ),
        );
      },
      err: (_) => emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      ),
    );
  }

  void _onSourceChanged(
    HomeSourceChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        source: event.id,
      ),
    );
  }

  void _onCategoryChanged(
    HomeCategoryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        category: event.category,
      ),
    );
  }
}
