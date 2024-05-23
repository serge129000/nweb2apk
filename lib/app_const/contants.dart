// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

//map de couleur pour corriger l'exception du swatch
Map<int, Color> color = {
  50: Color.fromARGB(255, 255, 255, 255),
  100: Color.fromARGB(255, 255, 255, 255),
  200: Color.fromARGB(255, 255, 255, 255),
  300: Color.fromARGB(255, 255, 255, 255),
  400: Color.fromARGB(255, 255, 255, 255),
  500: Color.fromARGB(255, 255, 255, 255),
  600: Color.fromARGB(255, 255, 255, 255),
  700: Color.fromARGB(255, 255, 255, 255),
  800: Color.fromARGB(255, 255, 255, 255),
  900: Color.fromARGB(255, 255, 255, 255),
};
//votre code couleur sans le #. exemple 008080
String code = "ff7f00";

///ne pas toucher la ligne 21 et 22
String cnst = "0xFF$code";
MaterialColor first_color = MaterialColor(int.parse(cnst), color);
//lien vers l'app
String url = "https://www.miledoo.net/";
//delai d'affichage du splash screen
int delay = 3;
//infos de l'entreprise
String infos = "Application Mobile Miledoo E-commerce(non official)";
//nom de l'entreprise
String name = "MILEDOO";
//appbar elevation
double appbar_elevation = 0;
//floating action button
bool enable_floating_button = true;
//centrer le titre?
bool centerTitle = true;
//ajouter un menu deroulant de la droite
bool addDrawer = false;
//circular progress or gif
bool circlGf = false;
