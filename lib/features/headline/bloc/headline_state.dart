part of 'headline_bloc.dart';

enum HeadlineStatus {
  loading,
  success,
  error,
}

class HeadlineState extends Equatable {
  const HeadlineState({
    this.status = HeadlineStatus.loading,
    this.articles = const [],
    this.page = 1,
  });

  final HeadlineStatus status;
  final List<Article> articles;
  final int page;

  HeadlineState copyWith({
    HeadlineStatus? status,
    List<Article>? articles,
    int? page,
  }) {
    return HeadlineState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        articles,
        page,
      ];
}
