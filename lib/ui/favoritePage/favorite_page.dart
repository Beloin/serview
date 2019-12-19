import 'package:flutter/material.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/search_page/search_page.dart';
import 'package:serview/ui/profilePage/profile_page.dart';
import 'package:serview/ui/curriculumPage/curriculum_page.dart';

final String url =
    "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";
final String name = "Ubireudo da Silva Santos";
final String job = "Marceneiro";


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
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index) {
          //Modificar e colocar o ListTile
          return buildListFavorite();
        },
      ),
    );
  }
  buildListFavorite(){
    return GestureDetector(
      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CurriculumPage("email")));},
      child:Container(  
        padding: EdgeInsets.only(left: 5.0,top: 5.0,bottom: 20.0),
        child:Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20.0),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(url))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(name,style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(job,style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        StarDisplay(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),    
    );
  } 
}
