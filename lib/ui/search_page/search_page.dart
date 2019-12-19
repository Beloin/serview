import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/publicUser.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String search1;
  var publicUser = PublicUser();
  List<Map<String, dynamic>> searchList = List();

  Future getSearchList(String text) async {
    publicUser.loadLimitedPublicUsersByName(5, text);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      this.searchList = publicUser.allUsersByName;
    });
    if (this.searchList.length == 0) {
      onError();
    }
  }

  getSearchProfessions(){
    publicUser.loadLimitedPublicUsersByProfession(2, "Programador");
  }

  @override
  Widget build(BuildContext context) {
    //Lembrando que "search" é a categoria que essa Page recebe
    if (search == null || search == "") {
      return Scaffold(
        key: _scaffoldKey,
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
                    child: Container(
                        height: 50.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(15.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: "Pesquise aqui",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                          ),
                          onSubmitted: (text) {
                            getSearchList(text);
                          },
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ))),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: searchList.length,
                    itemBuilder: (context, index) {
                      return Builders.publicUserListTile(
                          name: publicUser.allUsersByName[index]["name"],
                          profession: publicUser.allUsersByName[index]
                              ["curriculum"]["profession"],
                          url:
                              "https://ih1.redbubble.net/image.803781402.0560/stf,small,600x600-pad,750x1000,f8f8f8.u1.jpg",
                          rate: publicUser.allUsersByName[index]["curriculum"]
                              ["rate"]);
                    },
                  ),
                ),
              ],
            ),
          ));
    } else {
      getSearchProfessions();
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Pesquisar"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0)),
              //Talvez coloque uma Row para colocar um Expanded para ficar bonito
              Row(
                children: <Widget>[
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Builders.publicUserListTile(
                            name: "aaa",
                            profession: "aaaaa",
                            url:
                                "https://ih1.redbubble.net/image.803781402.0560/stf,small,600x600-pad,750x1000,f8f8f8.u1.jpg");
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  onError() {
    final snackBar = SnackBar(
      content:
          Text('Falha ao encontrar o usuário'),
      backgroundColor: Colors.redAccent,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
