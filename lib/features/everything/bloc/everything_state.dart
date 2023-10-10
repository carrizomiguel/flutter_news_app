part of 'everything_bloc.dart';

enum EverythingStatus {
  loading,
  success,
  error,
}

class EverythingState extends Equatable {
  const EverythingState({
    this.status = EverythingStatus.loading,
    this.articles = const [],
    this.dateRange = (null, null),
    this.page = 1,
  });

  final EverythingStatus status;
  final List<Article> articles;
  final (DateTime?, DateTime?) dateRange;
  final int page;

  EverythingState copyWith({
    EverythingStatus? status,
    List<Article>? articles,
    (DateTime?, DateTime?)? dateRange,
    int? page,
  }) {
    return EverythingState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      dateRange: dateRange ?? this.dateRange,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        articles,
        dateRange,
        page,
      ];
}
