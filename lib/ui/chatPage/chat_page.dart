import 'package:flutter/material.dart';
import 'package:serview/ui/curriculumPage/curriculum_page.dart';

final String url =
    "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";
final String name = "Ubireudo da Silva Santos";
final String job = "Marceneiro";

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
        color: Colors.black26),
        itemCount: 5,
        itemBuilder: (context,index) {
          return buildListFavorite();
        },
      ),
    );
  }
  buildListFavorite(){
    return GestureDetector(
      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CurriculumPage()));},
      child:Container(  
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(url)
              )
            ),
          ),
          title: Text(name),
          subtitle: Text(job),
        ),
      ),
    );
  } 
}