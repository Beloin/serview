import 'package:flutter/material.dart';

class CurriculumPage extends StatefulWidget {
  @override
  _CurriculumPageState createState() => _CurriculumPageState();
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
  );
 }
}
