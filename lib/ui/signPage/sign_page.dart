import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serview/models/professions.dart';
import 'package:serview/ui/signPage/login.dart';
import 'package:serview/ui/signPage/signUp.dart';
import 'package:serview/ui/homePage/home_page.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  //Teste para Login:

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue,
            title: Text("Serview"),
            centerTitle: true,
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
                  child: LoginTab()),
              // Segunda Tab "Sign Up"
              Tab(
                  child: SignUpTab())
            ],
          ),
        ));
  }

}
