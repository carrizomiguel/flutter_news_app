import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

class Weather extends Equatable {
  const Weather({
    required this.info,
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      info: List<Info>.from(
        (json['weather'] as List).map(
          (x) => Info.fromJson(x as Map<String, dynamic>),
        ),
      ).first,
      main: Main.fromJson(
        json['main'] as Map<String, dynamic>,
      ),
    );
  }

  const Weather.empty()
      : this(
          info: const Info.empty(),
          main: const Main.empty(),
        );

  final Info info;
  final Main main;

  @override
  List<Object?> get props => [
        info,
        main,
      ];
}
