part of 'headline_bloc.dart';

sealed class HeadlineEvent extends Equatable {
  const HeadlineEvent();

  @override
  List<Object> get props => [];
}

class HeadlineRequested extends HeadlineEvent {
  const HeadlineRequested({
    required this.category,
  });

  final String category;
}
