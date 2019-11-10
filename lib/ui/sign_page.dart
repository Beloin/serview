import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String _email;
  String _password;
  double _hPadd = 20.0;

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
                  text: "Login",
                ),
                Tab(
                  text: "Sign Up",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //Primeira Tab "Login"
              Tab(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _hPadd, vertical: 5.0),
                          child: Text(
                            "Email:",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: _hPadd),
                      child: _buildFieldText(
                          onSubmitted: _email,
                          label: "Digite Aqui Seu Email",
                          colorText: Colors.black,
                          keyboardType: TextInputType.emailAddress),
                    ),
                    Divider(color: Colors.white, height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _hPadd, vertical: 5.0),
                          child: Text(
                            "Senha:",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 20.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: _hPadd),
                      child: _buildFieldText(
                        onSubmitted: _password,
                        label: "Digite Aqui Sua Senha",
                        colorText: Colors.black,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: _floatAction),
                    Divider(color: Colors.white, height: 50.0),
                  ],
                ),
              )),
              // Segunda Tab "Sign Up"
              Tab(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[],
                      ),
                    )
                  ]))
            ],
          ),
        ));
  }

  Widget _floatAction = FloatingActionButton.extended(
    backgroundColor: Colors.blueGrey,
    onPressed: () {},
    label: Text("Enviar Dados"),
    icon: Icon(Icons.send),
  );

  Widget _buildFieldText(
      {label = "TextField",
      colorText = Colors.blue,
      fontSize = 15.0,
      onSubmitted,
      obscureText = false,
      keyboardType = TextInputType.text}) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(25.0)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueGrey),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(25.0))),
      onSubmitted: (text) {
        onSubmitted = text;
        print(onSubmitted);
      },
      style: TextStyle(fontSize: fontSize, color: colorText),
    );
  }
}
