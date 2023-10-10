part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeSourcesRequested extends HomeEvent {}

class HomeSourceChanged extends HomeEvent {
  const HomeSourceChanged({
    required this.id,
  });

  final String id;
}

class HomeCategoryChanged extends HomeEvent {
  const HomeCategoryChanged({
    required this.category,
  });

  final String category;
}
