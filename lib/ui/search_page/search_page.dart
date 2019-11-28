import 'package:flutter/material.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/constructors/builders.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pesquisar"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Column(
            children: <Widget>[
              Builders.buildFieldText(
                label: "Pesquisar",
                colorText: Colors.black,
              )
            ],
          ),
        ));
  }
}
