import 'package:equatable/equatable.dart';

class Main extends Equatable {
  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'] as double,
      feelsLike: json['feels_like'] as double,
      tempMin: json['temp_min'] as double,
      tempMax: json['temp_max'] as double,
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
    );
  }

  const Main.empty()
      : this(
          temp: 0,
          feelsLike: 0,
          tempMin: 0,
          tempMax: 0,
          pressure: 0,
          humidity: 0,
          seaLevel: 0,
          grndLevel: 0,
        );

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int? seaLevel;
  final int? grndLevel;

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];
}
