import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Professions {
  Map<String, dynamic> prof = Map();

  Future<Null> saveProfessions(Map<String, dynamic> prof) async {
    this.prof = prof;
    await Firestore.instance
        .collection("professions")
        .document("professions")
        .setData(prof);
  }

  Future<Null> loadProfessions() async {
    DocumentSnapshot docProfessions = await Firestore.instance
        .collection("professions")
        .document("professions")
        .get();
        this.prof = docProfessions.data;
  }
}
