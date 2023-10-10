part of 'weather_bloc.dart';

enum WeatherStatus {
  loading,
  success,
  error,
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.loading,
    this.weather = const Weather.empty(),
    this.position,
  });

  final WeatherStatus status;
  final Weather weather;
  final Position? position;

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    Position? position,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props => [
        status,
        weather,
        position,
      ];
}
