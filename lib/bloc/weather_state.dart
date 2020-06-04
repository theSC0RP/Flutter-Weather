part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  Weather weather;

  WeatherLoaded(this.weather) : assert(weather != null);
}

class WeatherError extends WeatherState {}