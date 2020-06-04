import 'package:flutter/material.dart';
import 'package:weather/widgets/searchbar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Weather App', style: TextStyle(fontFamily: 'Times New Roman', fontSize: 25),)
        ),
      ),


      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(flex: 2, child: Image.asset('assets/weather.gif', height: 250, width: 250,)),

            Expanded(
              child: Container (
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: SearchBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

