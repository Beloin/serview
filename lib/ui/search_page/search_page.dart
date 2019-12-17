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

  @override
  Widget build(BuildContext context) {
    if (search != null || search != "") {
      
    }
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
            //Text(search),
            IconButton(
              icon: Icon(Icons.desktop_mac),
              onPressed: () async {
                var a = PublicUser();
                a.loadLimitedPublicUsers(1);
                await Future.delayed(Duration(seconds: 2));
                print(a.allUsersByNumFornecedor[0]["name"]);
              },
            ),
            //Talvez coloque uma Row para colocar um Expanded para ficar bonito
            Row(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Builders.buildListFavorite("profession", "name",
                          "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png");
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
