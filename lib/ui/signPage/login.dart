import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  String _test;

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      if (model.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                  child: Text(
                    "Email:",
                    style:
                        TextStyle(color: Colors.blueGrey, fontSize: _fontSize),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: _hPadd),
              child: Builders.buildFieldText(
                  onSubmitted: _test,
                  label: "Digite Aqui Seu Email",
                  colorText: Colors.black,
                  keyboardType: TextInputType.emailAddress),
            ),
            Divider(color: Colors.white, height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                  child: Text(
                    "Senha:",
                    style:
                        TextStyle(color: Colors.blueGrey, fontSize: _fontSize),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: _hPadd),
              child: Builders.buildFieldText(
                onSubmitted: _test,
                label: "Digite Aqui Sua Senha",
                colorText: Colors.black,
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Builders.floatSent(label: "Login", onPressed: (){
                  model.signIn();
                }),),
            Divider(color: Colors.white, height: 50.0),
          ],
        ),
      );
    });
  }
}
