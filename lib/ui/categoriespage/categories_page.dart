import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/professions.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/search_page/search_page.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Categorias'),
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(str: "aaaa",)));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            body: Column(children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: model.userProf.professions['professions'].length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      )),
                      child: ListTile(
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //Incluir aqui a ida para a pagina pesquisa
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage(str:
                                      model.userProf.professions['professions'][index]
                                    )));
                          },
                          title: Text(
                            model.userProf.professions['professions'][index],
                          )));
                },
              )),
            ]));
      },
    );
  }
}
