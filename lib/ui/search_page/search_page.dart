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
            Text(search),
            //Talvez coloque uma Row para colocar um Expanded para ficar bonito
            Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                  leading: Icon(Icons.person_pin_circle),
                  title: Text('Corno que dorme cedo'),
                  subtitle: Text('Acorda na gaiola'),
                  trailing: Icon(Icons.pets),
                )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
