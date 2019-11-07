import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("Aqui ficará a primeira aba do app")],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("Aqui ficará a segunda aba do app")],
                ),
              )
            ],
          ),
        ));
  }
}

//Criar método para a criação do TextField