part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.source = '',
    this.sources = const [],
    this.category = '',
    this.categories = const [],
  });

  final HomeStatus status;
  final String source;
  final List<Source> sources;
  final String category;
  final List<String> categories;

  HomeState copyWith({
    HomeStatus? status,
    String? source,
    List<Source>? sources,
    String? category,
    List<String>? categories,
  }) {
    return HomeState(
      status: status ?? this.status,
      source: source ?? this.source,
      sources: sources ?? this.sources,
      category: category ?? this.category,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [
        status,
        source,
        sources,
        category,
        categories,
      ];
}
