part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  String city;

  FetchWeather({this.city});
}
