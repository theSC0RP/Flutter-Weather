import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/model/weather_model.dart';

class Display extends StatefulWidget {
  String city;

  Display({this.city});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<WeatherBloc>(context)..add(FetchWeather(city: widget.city));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Weather', style: TextStyle(fontFamily: 'Times New Roman', fontSize: 25),)        
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading)
              return loadingSpinner;
            else if (state is WeatherLoaded)
              return weatherData(
                city: state.weather.city, 
                desc: state.weather.desc,
                humidity: state.weather.humidity,
                max_temp: state.weather.max_temp,
                min_temp: state.weather.min_temp,
                icon: state.weather.icon
              );
            else return errorMsg;
          },
        )
      )
    );
  }
}

Widget errorMsg = Center(
  child: Wrap(
    children: <Widget>[
      Text ('Error fetching weather data...', style: TextStyle(color: Colors.red, fontSize: 25))
    ],
  )
);

Widget loadingSpinner = Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
      ),
      SizedBox(height: 20),
      Text('Fetching weather data...', style: TextStyle(color: Colors.white, fontSize: 20))
    ],
  )
);

Widget weatherData({String city, String desc, double max_temp, double min_temp, int humidity, String icon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText('${city.toUpperCase()}', style: TextStyle(fontFamily: 'Times New Roman'), minFontSize: 27, maxFontSize: 35,),
                        SizedBox(height: 20),
                        Text('${desc[0].toUpperCase() + desc.substring(1)}', style: TextStyle(fontSize: 22, fontFamily: 'Times New Roman'),),
                      ],
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: icon[2] == 'n' ? Colors.grey[600] : Colors.blue[400]),
                      borderRadius: BorderRadius.circular(20),
                      color: icon[2] == 'n' ? Colors.grey[600] : Colors.blue[400]
                    ),
                    child: Image.network('http://openweathermap.org/img/wn/${icon}@2x.png')
                  )
                ],
              ),
              SizedBox(height: 15),
              Text('Temperature', style: TextStyle(fontSize: 22, fontFamily: 'Times New Roman')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Max: $max_temp F', style: TextStyle(fontSize: 20, fontFamily: 'Times New Roman')),
                  Text('Min: $min_temp F', style: TextStyle(fontSize: 20, fontFamily: 'Times New Roman'))
                ],
              ),
              SizedBox(height: 15),
              Text('Humidity: $humidity', style: TextStyle(fontSize: 22, fontFamily: 'Times New Roman')),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ],
  );
}