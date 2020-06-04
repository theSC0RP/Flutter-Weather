import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Empty field error'),
      content: Text('Please enter a city name'),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text('Dismiss')
        )
      ],
    );
  }
}