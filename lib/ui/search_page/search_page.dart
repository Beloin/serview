import 'package:flutter/material.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/constructors/builders.dart';

class SearchPage extends StatefulWidget {
  var searchVar;
  SearchPage({@required String searchVar}) {
    this.searchVar = searchVar;
  }

  @override
  _SearchPageState createState() => _SearchPageState(todo: searchVar);
}

class _SearchPageState extends State<SearchPage> {
  var nameController = TextEditingController();

  _SearchPageState({Key key, @required String todo}) {
    nameController.text = todo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Digite aqui"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Builders.buildFieldText(
                    label: "Pesquisar",
                    colorText: Colors.black,
                  ),
                  FlatButton(
                    child: Text("Pesquisar"),
                    onPressed: (){},
                    textColor: Colors.white,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
