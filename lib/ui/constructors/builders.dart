import 'package:flutter/material.dart';

class Builders{

  static Widget buildFieldText(
      {label = "TextField",
      colorText = Colors.blue,
      fontSize = 15.0,
      onSubmitted,
      obscureText = false,
      keyboardType = TextInputType.text}) {
    return Container(
        height: 50.0,
        child: TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: label,
            hintStyle: TextStyle(color: Colors.blueGrey),
          ),
          onSubmitted: (text) {
            onSubmitted = text;
            print(onSubmitted);
          },
          style: TextStyle(fontSize: fontSize, color: colorText),
        ));
  }

  static   Widget floatSent({label = "Label"}) {
    return Container(
        height: 45.0,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.blueGrey,
            onPressed: () {},
            label: Text(label),
            icon: Icon(Icons.send)));
  }

}
