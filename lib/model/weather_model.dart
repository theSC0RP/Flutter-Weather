class Weather {
  String city, desc, icon;
  double max_temp, min_temp;
  int humidity;


  Weather({this.city, this.desc, this.max_temp = 0.0, this.min_temp = 0.0, this.humidity = 0, this.icon});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      desc: json['weather'][0]['description'],
      max_temp: json['main']['temp_max'],
      min_temp: json['main']['temp_min'],
      humidity: json['main']['humidity'],
      icon: json['weather'][0]['icon']
    );
  }

  @override
  String toString() => 'Weather: {city: $city, rain: $desc, max temp: $max_temp, min temp: $min_temp, humidity: $humidity}';
}