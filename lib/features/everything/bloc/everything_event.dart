part of 'everything_bloc.dart';

sealed class EverythingEvent extends Equatable {
  const EverythingEvent();

  @override
  List<Object> get props => [];
}

class EverythingRequested extends EverythingEvent {
  const EverythingRequested({
    required this.sources,
    this.from,
    this.to,
  });

  final String sources;
  final DateTime? from;
  final DateTime? to;
}
