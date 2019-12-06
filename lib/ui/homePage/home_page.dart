import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/categoriespage/categories_page.dart';
import 'package:serview/ui/favoritePage/favorite_page.dart';
import 'package:serview/ui/signPage/sign_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text('Serview'),
            backgroundColor: Colors.lightBlue,
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              )
            ],),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CategoriesPage()));
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
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            Center(
              child: CircularProgressIndicator(),
            );
          return Column(
            children: <Widget>[
              Center(
                child: Text("${model.userData["name"]}"),
              ),
              Text("${model.userCurriculum["profession"]}")
            ],
          );
        }));
  }
}
