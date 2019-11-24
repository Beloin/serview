import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/professions.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/homePage/home_page.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        Professions prof;
        prof.loadProfessions();

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
                    onPressed: () {},
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
                padding: EdgeInsets.only(top: 10.0),
                itemCount: 0,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    prof.professions["professions"][index],
                  ));
                },
              )),
            ]));
      },
    );
  }
}
