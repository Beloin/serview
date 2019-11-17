import 'package:flutter/material.dart';
import 'package:serview/ui/constructors/builders.dart';

class SignInTab extends StatefulWidget {
  @override
  _SignInTabState createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {

  String _test;

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
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
                                border:
                                    Border.all(color: Colors.blue, width: 3.0),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image:
                                        AssetImage("assets/profile_pic.png"))),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: _hPadd, vertical: 5.0),
                          child: Text(
                            "Nome Completo:",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: _fontSize),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Builders.buildFieldText(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Builders.buildFieldText(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child: Builders.buildFieldText(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: _hPadd, vertical: 5.0),
                      child:  Builders.buildFieldText(
                          colorText: Colors.black,
                          obscureText: true,
                          label: "Digite Aqui Sua Senha Novamente",
                          onSubmitted: _test),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Builders.floatSent(label: "Sign Up")),
                    Divider(color: Colors.white, height: 50.0),
                  ],
                ),
              );
  }
}