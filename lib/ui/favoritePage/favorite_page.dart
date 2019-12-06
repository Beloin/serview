import 'package:flutter/material.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/search_page/search_page.dart';
import 'package:serview/ui/profilePage/profile_page.dart';


class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ],
          ),
      ),
    );
  }
}