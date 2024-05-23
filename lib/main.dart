import 'package:flutter/material.dart';
import 'app_const/contants.dart';
import 'mainpage/index.dart';
void main(List<String> args) {
  runApp(MaterialApp(
    title: name,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      //primaryColor: first_color,
      primarySwatch: first_color
    ),
    home:const Index(),
  ));
}
