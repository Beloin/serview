import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Serview",
              style: TextStyle(fontSize: 20),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Sign In",
                ),
                Tab(
                  text: "Sign Up",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //Primeira Tab
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        "Email:",
                        style: TextStyle(color: Colors.blue, fontSize: 25.0),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: _buildFieldText(
                          onSubmitted: _email,
                          label: "Digite Aqui Seu Email",
                          colorText: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        "Senha:",
                        style: TextStyle(color: Colors.blue, fontSize: 25.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: _buildFieldText(
                          onSubmitted: _password,
                          label: "Digite Aqui Sua Senha",
                          colorText: Colors.black,
                          obscureText: true),
                    ),
                  ],
                ),
              ),
              // Segunda Tab
              Tab(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[]))
            ],
          ),
        ));
  }

  Widget _buildFieldText(
      {label = "TextField",
      colorText = Colors.blue,
      fontSize = 15.0,
      onSubmitted, obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      onSubmitted: (text) {
        onSubmitted = text;
        print(onSubmitted);
      },
      style: TextStyle(fontSize: fontSize, color: colorText),
      textAlign: TextAlign.left,
    );
  }
}
