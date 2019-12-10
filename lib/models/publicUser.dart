import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

//Colocar informações do público
//Possivelmente preciso ainda salvar o currículo dentro das informações públicas???

class PublicUser {
  Map<String, dynamic> publicUserData = Map();
  Map<String, dynamic> allPublicUsers = Map();

  Future<Null> loadAllPublicUsers() async {
    DocumentSnapshot docPublicUser = await Firestore.instance
        .collection('publicuser')
        .document('publicList')
        .get();
    this.allPublicUsers = docPublicUser.data;
    //this.publicUserCurriculum = allPublicUser['curriculum'];
  }

  Future<Null> loadUserByEmail(String email) async {
    loadAllPublicUsers();
    for (var i = 0; i < allPublicUsers['public'].length; i++) {
      if(allPublicUsers['public'][i]['email'] == email){
        this.publicUserData = allPublicUsers['public'][i];
      }
    }
  }
}
