import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:headline_repository/headline_repository.dart';
import 'package:news_api/news_api.dart';

part 'headline_event.dart';
part 'headline_state.dart';

class HeadlineBloc extends Bloc<HeadlineEvent, HeadlineState> {
  HeadlineBloc({
    required this.repository,
  }) : super(const HeadlineState()) {
    on<HeadlineRequested>(_onRequested);
  }

  final HeadlineRepository repository;

  Future<void> _onRequested(
    HeadlineRequested event,
    Emitter<HeadlineState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HeadlineStatus.loading,
      ),
    );
    final result = await repository.getHeadlines(
      category: event.category,
      page: state.page,
    );
    result.when(
      ok: (headlines) {
        emit(
          state.copyWith(
            page: 1,
            articles: headlines.$2,
            status: HeadlineStatus.success,
          ),
        );
      },
      err: (_) => emit(
        state.copyWith(
          status: HeadlineStatus.error,
        ),
      ),
    );
  }
}
