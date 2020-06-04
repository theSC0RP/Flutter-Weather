import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:weather/model/weather_model.dart';

Future getWeather({String city, String apiKiey ='a8f1148f509c0c09cb2587b1f28616f0'}) async {
  var response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKiey');

  if(response.statusCode == 200) {
    Weather cityWeather = Weather.fromJSON(json.decode(response.body));
    print(cityWeather);
    return cityWeather;
  } else {
    throw Exception('Error');
  }
}