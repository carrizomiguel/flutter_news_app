import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everything_repository/everything_repository.dart';
import 'package:news_api/news_api.dart';

part 'everything_event.dart';
part 'everything_state.dart';

class EverythingBloc extends Bloc<EverythingEvent, EverythingState> {
  EverythingBloc({
    required this.repository,
  }) : super(const EverythingState()) {
    on<EverythingRequested>(_onRequested);
  }

  final EverythingRepository repository;

  Future<void> _onRequested(
    EverythingRequested event,
    Emitter<EverythingState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EverythingStatus.loading,
        dateRange: (
          event.from ??
              DateTime.now().subtract(
                const Duration(days: 6),
              ),
          event.to ?? DateTime.now(),
        ),
      ),
    );
    final result = await repository.getEverything(
      from: state.dateRange.$1!.toIso8601String(),
      to: state.dateRange.$2!.toIso8601String(),
      sources: event.sources,
      page: state.page,
    );
    result.when(
      ok: (everything) {
        emit(
          state.copyWith(
            page: 1,
            articles: everything.$2,
            status: EverythingStatus.success,
          ),
        );
      },
      err: (_) => emit(
        state.copyWith(
          status: EverythingStatus.error,
        ),
      ),
    );
  }
}
