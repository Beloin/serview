import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

//Colocar informações do público


class PublicUser {
  Map<String, dynamic> publicUserData;
  Map<String, dynamic> allPublicUsers = Map();
  List<Map<String, dynamic>> allUsersByProfession;
  List<Map<String, dynamic>> allUsersByNumFornecedor;
  List<Map<String, dynamic>> allUsersByName;

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

  Future loadPublicUserByEmail2(String email) async {
    _getCollectionByEmail(email);
  }
  Future loadLimitedPublicUsers(num) async{
    _getLimitedCollection(num);
  }
  Future loadLimitedPublicUsersByName(int num, String name) async{
    _getLimitedCollectionByName(num, name);
  }
    Future loadLimitedPublicUsersByProfession(int num, String name) async{
    _getCollectionByProfession(name, num);
  }
  

  Future<Map<String, dynamic>> _getCollectionByEmail(String email) async {
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

  Future<List<Map<String, dynamic>>> _getLimitedCollectionByName(
      int num, String name) async {
    List<DocumentSnapshot> templist;
    List<Map<String, dynamic>> list = new List();
    CollectionReference collectionRef =
        Firestore.instance.collection("publicUsers");
    QuerySnapshot collectionSnapshot =
        await collectionRef.where("name", isEqualTo: name).limit(num).getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    allUsersByName = list;
    print(allUsersByName.length);
    return list;
  }

  Future<List<Map<String, dynamic>>> _getCollectionByProfession(
      String profession, int num) async {
    List<DocumentSnapshot> templist;
    List<Map<String, dynamic>> list = new List();
    CollectionReference collectionRef =
        Firestore.instance.collection("publicUsers");
    QuerySnapshot collectionSnapshot = await collectionRef
        .where("profession", isEqualTo: profession).limit(num)
        .getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    allUsersByProfession = list;
    print(allUsersByProfession.length);
    return list;
  }

  Future<List<Map<String, dynamic>>> _getLimitedCollection(
      int num) async {
    List<DocumentSnapshot> templist;
    List<Map<String, dynamic>> list = new List();
    CollectionReference collectionRef =
        Firestore.instance.collection("publicUsers");
    QuerySnapshot collectionSnapshot =
        await collectionRef.where("fornecedor", isEqualTo: true).limit(num).getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    allUsersByNumFornecedor = list;
    return list;
  }

}
