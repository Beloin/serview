import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';
import 'package:serview/ui/homePage/home_page.dart';

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  String _test;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      if (model.isLoading)
        return Scaffold(
            key: _scaffoldKey,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ]));
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
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
                  controller: _emailController,
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
                controller: _passController,
                onSubmitted: _test,
                label: "Digite Aqui Sua Senha",
                colorText: Colors.black,
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Builders.floatSent(label: "Login", onPressed: (){
                  model.signIn(
                    email: _emailController.text,
                    pass: _passController.text,
                    onSuccess: _onSuccess,
                    onFail: _onFail,
                  );
                }),),
            Divider(color: Colors.white, height: 50.0),
          ],
        ),
      ),
      ) ;
    });
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Login com sucesso!'),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  void _onFail() {
    final snackBar = SnackBar(
      content: Text('Falha ao entrar na sua conta'),
      backgroundColor: Colors.redAccent,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
