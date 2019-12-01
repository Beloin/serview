import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';

class SearchPage extends StatefulWidget {
  final String str;
  SearchPage({this.str});

  @override
  _SearchPageState createState() => _SearchPageState(search: str);
}

class _SearchPageState extends State<SearchPage> {
  final String search;

  _SearchPageState({this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisar"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: Builders.buildFieldText(
                  label: "Escreva aqui",
                  colorText: Colors.black,
                )),
            FlatButton(
              onPressed: () {
                print(search);
              },
              child: Icon(Icons.details),
            ),
            ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                model.loadTestUser("PCj7HTwtvEqjqxdSVxN4");
                print(model.testUserData['name']);
                //print(model.testUserCurriculum['profession']);
                return Builders.listTilePerfil(
                    usrName: model.testUserData['name'], usrProf: "aaaaa");
              },
            )
          ],
        ),
      ),
    );
  }
}
