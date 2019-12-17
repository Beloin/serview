import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/constructors/builders.dart';

final String url =
    "https://rd1.com.br/wp-content/uploads/2019/09/20190908-rd1-alexandre-frota.png";
final String name = "Ubireudo da Silva Santos";
final String email = "ubireudosilva@gmail.com";
final String job = "Marceneiro";


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model){
      return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Color(0xFF03A9F4),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120.0,
                    height: 120.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitHeight, image: NetworkImage(url)
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFE1F5FE),
              height: 50.0,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text("PERFIL", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(100, 0, 0, 0))),
                ],
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Nome", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                  Text(model.userData["name"], style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Email", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                  Text(model.userData["email"], style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
            Container(
              color: Color(0xFFE1F5FE),
              height: 50.0,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text("EDITAR PERFIL", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(100, 0, 0, 0))),
                ],
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Editar Nome", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Builders.buildFieldText(
                      colorText: Colors.black,
                      label: "Digite Aqui Seu Novo Nome",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("Salvar Alterações"),
                    color: Colors.lightBlue[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),                  
                ],
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Editar Senha", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Builders.buildFieldText(
                      colorText: Colors.black,
                      label: "Digite Aqui Sua Nova Senha",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("Salvar Alterações"),
                    color: Colors.lightBlue[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Editar Foto de Perfil", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                children: <Widget>[],
              ),
            ),
            Container(
              color: Color(0xFFE1F5FE),
              height: 50.0,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text("TORNE-SE UM FORNECEDOR", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(100, 0, 0, 0))),
                ],
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Profissão", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                children: <Widget>[],
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Descrição", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(150, 0, 0, 0))),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Builders.buildFieldText(
                      colorText: Colors.black,
                      label: "Digite Aqui Sua Descrição(300 caracteres)",
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("Salvar Alterações"),
                  color: Colors.lightBlue[200],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          ],
        ),
     ),
    );
    },);
  }
}