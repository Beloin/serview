import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

//Colocar informações do público
//Possivelmente preciso ainda salvar o currículo dentro das informações públicas???

class PublicUser {
  Map<String, dynamic> publicUserData = Map();
  Map<String, dynamic> allPublicUsers = Map();

  // void loadPublicUser(String email) {
  //   Firestore.instance
  //       .collection("publicUsers")
  //       .where('email', isEqualTo: email)
  //       .snapshots()
  //       .listen((data) {
  //     data.documents.forEach((doc) {
  //       //Dados usados apenas uma vez, descobrir como transformar para usar no total
  //     });
  //   });
  // }

  Future loadPublicUserByEmail2(String email)async{
    _getCollection(email).then((onValue){this.publicUserData = onValue;});
    await Future.delayed(Duration(seconds: 2));
  }

  Future<Map<String, dynamic>> _getCollection(String email) async {
    List<DocumentSnapshot> templist;
    List<Map<String, dynamic>> list = new List();
    CollectionReference collectionRef =
        Firestore.instance.collection("publicUsers");
    QuerySnapshot collectionSnapshot =
        await collectionRef.where('email', isEqualTo: email).getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    this.publicUserData = list[0];
    return list[0];
  }
}
