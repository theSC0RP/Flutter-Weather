import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/repositories/weather_repo.dart';
import 'package:weather/screens/display.dart';
import 'package:weather/widgets/dialog_box.dart';

class SearchBar extends StatelessWidget {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cityController,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20, 
        fontFamily: 'Times New Roman'
      ),

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30)
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),

        contentPadding: EdgeInsets.only(left: 30, top: 10, bottom: 10),

        hintText: 'Enter city name',
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            String cityName = cityController.text;
            cityController.text = '';
            if (cityName == '') {
              print('blank city name');
              showDialog(
                context: context, 
                builder: (BuildContext context){
                  return DialogBox();
                }
              );
            }
            else {
              // print(getWeather(city: cityName));
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<WeatherBloc>(context),
                    child: Display(city: cityName,),
                  )
                )
              );

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (BuildContext context) => Display())
              // );
            }
          },
          
          child: Icon(Icons.search, color: Colors.white)
        ),
      ),
    );
  }
}