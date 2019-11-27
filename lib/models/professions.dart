import 'dart:convert'; 
import 'package:cloud_firestore/cloud_firestore.dart';

class Professions {
  Map<String, dynamic> professions = Map();

  Future<Null> saveProfessions(Map<String, dynamic> prof) async {
    this.professions = prof;
    await Firestore.instance
        .collection("profession")
        .document("professions")
        .setData(prof);
  }

  Future<Null> loadProfessions() async {
    DocumentSnapshot docProfessions = await Firestore.instance
        .collection("profession")
        .document("professions")
        .get();
    this.professions = docProfessions.data;
  }

}
