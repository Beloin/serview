import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:serview/models/professions.dart';

class UserModel extends Model {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();
  Map<String, dynamic> userCurriculum = Map();

  Map<String, dynamic> testUserData = Map();
  Map<String, dynamic> testUserCurriculum = Map();


  bool isLoading = false;
  bool logged = true;

  @override
  void addListener(listener) {
    super.addListener(listener);
    _loadCurrrentUser();
  }

  void signUp(
      {@required Map<String, dynamic> userData,
      @required Map<String, dynamic> userCurriculum,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user.user;
      await _saveUserData(userData);
      await _saveUserCurriculum(userCurriculum);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      firebaseUser = user.user;

      await _loadCurrrentUser();

      onSuccess();

      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void recoverPass() {}

  void isLoggedIn(){
    if(userData["name"] != null){
      logged = true;
    }
    else logged = false;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(userData);
  }

  Future<Null> _saveUserCurriculum(Map<String, dynamic> userCurriculum) async {
    this.userCurriculum = userCurriculum;
    await Firestore.instance
        .collection("curriculum")
        .document(firebaseUser.uid)
        .setData(userCurriculum);
  }

  void signOut() async {
    await _auth.signOut();
    userData = Map();
    userCurriculum = Map();
    firebaseUser = null;
    notifyListeners();
  }

  Future<Null> _loadCurrrentUser() async {
    if (firebaseUser == null) firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      if (userData["name"] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .get();
        userData = docUser.data;
        DocumentSnapshot docUserCur = await Firestore.instance
            .collection("curriculum")
            .document(firebaseUser.uid)
            .get();
            userCurriculum = docUserCur.data;
      }
      notifyListeners();
    }
  }
    Future<Null> loadTestUser(String userUid) async {
        DocumentSnapshot docUser = await Firestore.instance
            .collection("users")
            .document(userUid)
            .get();
        testUserData = docUser.data;
        DocumentSnapshot docUserCur = await Firestore.instance
            .collection("curriculum")
            .document(userUid)
            .get();
            testUserCurriculum = docUserCur.data;
      notifyListeners();
  }
}
