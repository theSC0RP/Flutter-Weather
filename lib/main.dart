import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app.dart';
import 'bloc/weather_bloc.dart';

void main() {
  runApp(
    // BlocProvider<WeatherBloc>(
    // create: (context) => WeatherBloc(), 
    // child: MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark(),
    //   home: App()
    // ))
    
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: App(),
      ),
    )
  );
}
