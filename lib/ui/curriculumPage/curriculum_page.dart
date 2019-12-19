import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/publicUser.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/categoriespage/categories_page.dart';
import 'package:serview/ui/profilePage/profile_page.dart';

class CurriculumPage extends StatefulWidget {
  final String email;
  CurriculumPage(this.email);
  @override
  _CurriculumPageState createState() => _CurriculumPageState(email);
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 3})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Color(0xFFFFC107),
        );
      }),
    );
  }
}

class _CurriculumPageState extends State<CurriculumPage> {
  final String email;
  _CurriculumPageState(this.email);

  PublicUser publicUser = PublicUser();
  Map<String, dynamic> publicUserData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    publicUser.loadPublicUserByEmail2(email);
    this.publicUserData = publicUser.publicUserData;
  }

  final String url =
      "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";


  Future getPublicUser() async {
    await Future.delayed(Duration(seconds: 1));
    if (this.publicUserData == null) {
      setState(() {
        this.publicUserData = publicUser.publicUserData;
      });
    } else {
      getPublicUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.publicUserData == null) {
      getPublicUser();
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Serview'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
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
              icon: Icon(Icons.chat),
              onPressed: () {},
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
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight, image: NetworkImage(url))),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //Nome do Fornecedor
                              Text(publicUserData["name"], style: TextStyle(fontSize: 28)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              //Nome da Profissão
                              Text(publicUserData["curriculum"]["profession"], style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Row(
                            children: <Widget>[StarDisplay(value: publicUserData["curriculum"]["rate"])],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Descrição:", style: TextStyle(fontSize: 32)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 15.0, right: 5.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: const Color(0xFF03A9F4),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  //Description
                  child: Text(publicUserData["curriculum"]["description"],
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
