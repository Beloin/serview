import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/professions.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  double _hPadd = 20.0;
  double _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
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
          key: _scaffoldKey,
          body: SingleChildScrollView(
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
                  onTap: () async {
                  //   File imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);
                  //   if(imgFile == null) return;
                  //   StorageUploadTask task = FirebaseStorage.instance.ref().child("imgPerfil").putFile(imgFile);

                  // (await task.future).downloadUrl.toString();

                  },
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
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPadd, vertical: 5.0),
                  child: Builders.buildFieldText(
                    controller: _nameController,
                    colorText: Colors.black,
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
                  ),
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
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Builders.floatSent(
                        label: "Sign Up",
                        onPressed: () {
                          Map<String, dynamic> userData = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "fornecedor": false,
                            "urlFoto" : 'url'
                          };
                          //Salvo já currículo só para teste, apagar depois
                          Map<String, dynamic> userCurriculum = {
                            "name": _nameController.text,
                            "profession": null,
                            "description": null,
                            "rate": 3
                          };
                          //Necessário criar e trocar para "email"
                          Map<String, dynamic> publicUser = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "fornecedor": false,
                            'curriculum': userCurriculum,
                            "profession": userCurriculum["profession"]
                          };
                          model.signUp(
                              userCurriculum: userCurriculum,
                              userData: userData,
                              publicUser: publicUser,
                              pass: _passwordController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        })),
                Divider(color: Colors.white, height: 50.0),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Usuário criado com sucesso!'),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  void _onFail() {
    final snackBar = SnackBar(
      content: Text('Falha ao criar sua conta'),
      backgroundColor: Colors.redAccent,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
