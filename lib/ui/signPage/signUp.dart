import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _test;

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoading)
          Center(
            child: CircularProgressIndicator(),
          );
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                      width: 125.0,
                      height: 125.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3.0),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage("assets/profile_pic.png"))),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add_a_photo),
                      )),
                ),
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                    child: Text(
                      "Nome Completo:",
                      style: TextStyle(
                          color: Colors.blueGrey, fontSize: _fontSize),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                child: Builders.buildFieldText(
                  controller: _nameController,
                  colorText: Colors.black,
                  onSubmitted: _test,
                  label: "Digite Aqui Seu Nome Completo",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Text(
                        "Seu Email:",
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: _fontSize),
                      ))
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                child: Builders.buildFieldText(
                  controller: _emailController,
                  colorText: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  label: "Digite Aqui Seu Email",
                  onSubmitted: _test,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Text(
                        "Sua Senha:",
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: _fontSize),
                      ))
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                child: Builders.buildFieldText(
                    controller: _passwordController,
                    colorText: Colors.black,
                    obscureText: true,
                    label: "Digite Aqui Sua Senha",
                    onSubmitted: _test),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Text(
                        "Sua Senha Novamente:",
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: _fontSize),
                      ))
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                child: Builders.buildFieldText(
                    colorText: Colors.black,
                    obscureText: true,
                    label: "Digite Aqui Sua Senha Novamente",
                    onSubmitted: _test),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Builders.floatSent(
                      label: "Sign Up",
                      onPressed: () {
                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                        };
                        model.signUp(
                            userData: userData,
                            pass: _passwordController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      })),
              Divider(color: Colors.white, height: 50.0),
            ],
          ),
        );
      },
    );
  }

  void _onSuccess(){

  }

  void _onFail(){
    final snackBar = SnackBar(content: Text('Falha ao criar sua conta'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

}
