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
    if (search != null || search != "") {}
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
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Builders.publicUserListTile(
                          name: "aaa",
                          profession: "aaaaa",
                          url:
                              "data:image/jpeg;base64,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");
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
