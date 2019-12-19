import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/search_page/search_page.dart';
import 'package:serview/ui/signPage/sign_page.dart';
import 'package:serview/ui/profilePage/profile_page.dart';
import 'package:serview/ui/curriculumPage/curriculum_page.dart';
import 'package:serview/ui/categoriespage/categories_page.dart';
import 'package:serview/ui/favoritePage/favorite_page.dart';

var global = 0;


void main(){ 
runApp(
      ScopedModel<UserModel>(
          model: UserModel(),
          child: MaterialApp(
<<<<<<< HEAD
            debugShowCheckedModeBanner: false,
=======
>>>>>>> d04b8208aa4ea4228af5237d7b8d0255b8896dd8
            home: SignPage()
          )),
    );
}