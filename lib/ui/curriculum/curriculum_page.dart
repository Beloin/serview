import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';

class CurriculumPage extends StatefulWidget {
  @override
  _CurriculumPageState createState() => _CurriculumPageState();
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class _CurriculumPageState extends State<CurriculumPage> {
  final String url =
      "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";
  final String name = "Ubireudo Silva";
  final String job = "Marceneiro";

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (contex, child, model) {
        model.loadTestUser("YVU8qBRiFbcklV5QiV1SfpaFciN2");
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
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
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(url))),
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
                                  Text(model.testUserData["name"],
                                      style: TextStyle(fontSize: 28)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  //Nome da Profissão
                                  Text(model.testUserCurriculum["profession"],
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Row(
                                children: <Widget>[StarDisplay(value: model.testUserCurriculum["rate"])],
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
                      child: Text(
                          model.testUserCurriculum["description"],
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
