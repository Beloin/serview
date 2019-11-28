import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serview/models/user_model.dart';
import 'package:serview/ui/homePage/home_page.dart';
import 'package:serview/ui/search_page/search_page.dart';
import 'package:serview/ui/signPage/sign_page.dart';
import 'package:serview/ui/curriculum/curriculum_page.dart';

void main() => runApp(
      ScopedModel<UserModel>(
          model: UserModel(),
          child: MaterialApp(
            home: HomePage()
          )),
    );
