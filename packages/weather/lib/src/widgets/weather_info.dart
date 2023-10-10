import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepositoryImpl(),
      child: BlocProvider(
        lazy: false,
        create: (context) => WeatherBloc(
          repository: context.read<WeatherRepositoryImpl>(),
        )..add(WeatherRequested()),
        child: _WeatherItem(),
      ),
    );
  }
}

class _WeatherItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherStatus.loading:
            return const SizedBox.shrink();
          case WeatherStatus.success:
            final weather = state.weather;
            final isByDay = weather.info.icon.contains('d');

            return Row(
              children: [
                Image.network(
                  Endpoints.icon(
                    weather.info.icon,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isByDay
                          ? [
                              Colors.lightBlue.shade300,
                              Colors.blue,
                              Colors.blue.shade600,
                            ]
                          : const [
                              Color(0xFF2f3f81),
                              Color(0xFF1D2B5C),
                              Color(0xFF0A113D),
                            ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${weather.main.temp.round()}°C',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            );
          case WeatherStatus.error:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
