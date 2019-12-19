import 'package:flutter/material.dart';
import 'package:serview/ui/curriculumPage/curriculum_page.dart';

class Builders {
  static Widget buildFieldText(
      {label = "TextField",
      colorText = Colors.blue,
      fontSize = 15.0,
      onSubmitted,
      obscureText = false,
      keyboardType = TextInputType.text,
      controller}) {
    return Container(
        height: 50.0,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: label,
            hintStyle: TextStyle(color: Colors.blueGrey),
          ),
          onSubmitted: (text) {
            onSubmitted = text;
            print(onSubmitted);
          },
          style: TextStyle(fontSize: fontSize, color: colorText),
        ));
  }

  static Widget floatSent({label = "Label", onPressed}) {
    return Container(
        height: 45.0,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.blueGrey,
            onPressed: onPressed,
            label: Text(label),
            icon: Icon(Icons.send)));
  }

  static Widget buildListFavorite(profession, name, url) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fitHeight, image: NetworkImage(url))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(name, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(profession, style: TextStyle(fontSize: 18)),
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
    );
  }

  static Widget userListTile(String url) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: NetworkImage(url))),
        ),
      ],
    );
  }

  static Widget publicUserListTile(
      {@required String name,
      @required String profession,
      @required String url,
      int rate = 3}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: NetworkImage(url))),
      ),
      title: Text(name),
      subtitle: Text(profession),
      trailing: StarDisplay(
        value: rate,
      ),
    );
  }
}
