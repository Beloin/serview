import 'package:flutter/material.dart';

class CurriculumPage extends StatefulWidget {
  @override
  _CurriculumPageState createState() => _CurriculumPageState();
}

final String url = "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";
final String name = "Ubireudo Silva";
final String job = "Marceneiro";

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
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:Text('Serview'),
      backgroundColor: Colors.lightBlue,
      centerTitle: true,
      leading: 
        IconButton(icon: Icon(Icons.keyboard_backspace),onPressed: () {},),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.favorite_border), onPressed: () {},),
      ],
    ),
    bottomNavigationBar: BottomAppBar(
      child:Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          IconButton(icon: Icon(Icons.chat), onPressed: () {},),
          IconButton(icon: Icon(Icons.person), onPressed: () {},),
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
                        image: NetworkImage(url) 
                      )
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0,bottom: 5.0),
                child:Row(
                children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(name,
                      style: TextStyle(fontSize: 28)
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(job,
                      style: TextStyle(fontSize: 20)
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      StarDisplay(value: 4)
                    ],
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
                padding: EdgeInsets.only(top: 25.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Descrição:",
                    style: TextStyle(fontSize: 32)
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Text("Joiner është përgjegjës profesional për të punuar me dru, ndërtimin dhe riparimin e mobiljeve, dekorative, utilitare dhe copa të tjera të drurit.",
                style: TextStyle(fontSize: 16)
                ),
              ),
            ],
          ),
      ],
    ),
  ),
  );
 }
}