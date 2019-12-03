import 'package:flutter/material.dart';

class Builders {
  static Widget buildFieldText(
      {label = "TextField",
      colorText = Colors.blue,
      fontSize = 15.0,
      onSubmitted,
      obscureText = false,
      keyboardType = TextInputType.text,
      controller}) {
    return Container(
        height: 50.0,
        child: TextField(
          controller: controller,
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

  static Widget floatSent({label = "Label", onPressed}) {
    return Container(
        height: 45.0,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.blueGrey,
            onPressed: onPressed,
            label: Text(label),
            icon: Icon(Icons.send)));
  }

  static Widget listTilePerfil({@required String usrName, @required usrProf}) {
    return ListTile(
        leading: Container(
          width: 125.0,
          height: 125.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/profile_pic.png"))),
        ),
        title: Text(usrName),
        subtitle: Text(usrProf));
  }
}
