
import 'package:flutter/material.dart';
import 'package:fluttertest/adminside/AdminSide.dart';
import 'package:fluttertest/Userside.dart';
import 'package:fluttertest/adminside/UsersList.dart';
import 'package:fluttertest/welcomescreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/":(context) => WelcomeWidget(),
    "/userSide" : (context) => UserSide(),
    "/adminSide": (context) => AdminSide(),
    "/usersList": (context) => UsersList()

  },
));

