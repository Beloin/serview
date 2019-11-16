import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serview/(unused)classes/classes.dart';
import 'package:serview/ui/home_page.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  //Teste para Login:
  String _email;
  String _password;

  //Teste para Sign Up:
  String _name;
  String _emailSign;
  String _passwordSign;
  String _passwordSign2;

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Row(children: <Widget>[
              IconButton(icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage()
                  ));
                },
              ),
              Text(
              "Serview",
              style: TextStyle(fontSize: 20),
            ),
            ],),
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
                                color: Colors.blueGrey, fontSize: _fontSize),
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
                                color: Colors.blueGrey, fontSize: _fontSize),
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
                        child: _floatSent(label: "Login")),
                    Divider(color: Colors.white, height: 50.0),
                  ],
                ),
              )),
              // Segunda Tab "Sign Up"
              Tab(
                  child: SingleChildScrollView(
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
                      child: _buildFieldText(
                        colorText: Colors.black,
                        onSubmitted: _name,
                        label: "Digite Aqui Seu Nome Completo:",
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
                      child: _buildFieldText(
                        colorText: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        label: "Escreva Aqui Seu Email",
                        onSubmitted: _emailSign,
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
                      child: _buildFieldText(
                          colorText: Colors.black,
                          obscureText: true,
                          label: "Escreva Aqui Sua Senha",
                          onSubmitted: _passwordSign),
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
                      child: _buildFieldText(
                          colorText: Colors.black,
                          obscureText: true,
                          label: "Escreva Aqui Sua Senha Novamente",
                          onSubmitted: _passwordSign2),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: _floatSent(label: "Sign Up")),
                    Divider(color: Colors.white, height: 50.0),
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  Widget _floatSent({label = "Label"}) {
    return Container(
      height: 45.0,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        label: Text(label),
        icon: Icon(Icons.send))
    );
  }

  Widget _buildFieldText(
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
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueGrey),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15.0))),
      onSubmitted: (text) {
        onSubmitted = text;
        print(onSubmitted);
      },
      style: TextStyle(fontSize: fontSize, color: colorText),
    )
    );
  }
}
