import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/publicUser.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/categoriespage/categories_page.dart';
import 'package:serview/ui/constructors/builders.dart';
import 'package:serview/ui/curriculumPage/curriculum_page.dart';
import 'package:serview/ui/favoritePage/favorite_page.dart';
import 'package:serview/ui/profilePage/profile_page.dart';
import 'package:serview/ui/signPage/sign_page.dart';
import 'package:serview/ui/search_page/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var publicUser = PublicUser();
  List<Map<String, dynamic>> publicHomeList = List();

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    publicUser.loadLimitedPublicUsers(20);
    this.publicHomeList = publicUser.allUsersByNumFornecedor;
  }

  Future getHomeList() async {
    await Future.delayed(Duration(seconds: 2));
    if (this.publicHomeList == null) {
      setState(() {
        this.publicHomeList = publicUser.allUsersByNumFornecedor;
      });
    } if (this.publicHomeList == null) getHomeList();
  }

  @override
  Widget build(BuildContext context) {
    if (this.publicHomeList == null) {
      getHomeList();
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        //Fazer forma de mandar para SignPage quando não logado.
        // model.firebaseUser = null;
        // if (model.firebaseUser == null) {
        //    Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignPage()));
        // }
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Serview'),
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritePage()));
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    itemCount: publicHomeList.length,
                    itemBuilder: (cntx, index) {
                      return GestureDetector(
                        child: Builders.publicUserListTile(
                          rate: publicHomeList[index]["curriculum"]["rate"],
                          name: publicHomeList[index]["name"],
                          profession: publicHomeList[index]["curriculum"]
                              ["profession"],
                          url:
                              "https://ogimg.infoglobo.com.br/in/23859542-7bb-970/FT1086A/652/xAlexandre-Frota.jpg.pagespeed.ic.ngPQs22mEC.jpg",
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurriculumPage(
                                      publicHomeList[index]["email"])));
                        },
                      );
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
