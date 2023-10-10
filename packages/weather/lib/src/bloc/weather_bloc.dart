import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.repository,
  }) : super(const WeatherState()) {
    on<WeatherRequested>(_onRequested);
  }

  final WeatherRepository repository;

  Future<void> _onRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      final ask = await Geolocator.requestPermission();
      if (ask != LocationPermission.whileInUse &&
          ask != LocationPermission.always) {
        emit(
          state.copyWith(
            status: WeatherStatus.error,
          ),
        );
        return;
      }
    }
    final position = await Geolocator.getCurrentPosition();
    emit(state.copyWith(position: position));
    final result = await repository.getWeather(
      lat: state.position!.latitude.toString(),
      lon: state.position!.longitude.toString(),
    );
    result.when(
      ok: (weather) => emit(
        state.copyWith(
          weather: weather,
          status: WeatherStatus.success,
        ),
      ),
      err: (_) => emit(
        state.copyWith(
          status: WeatherStatus.error,
        ),
      ),
    );
  }
}
