import 'package:flutter/material.dart';

ThemeData pokedexTheme = ThemeData(
  // Define the default Brightness and Colors
  brightness: Brightness.light,
  primaryColor: Color(0xFFFB0605),
  accentColor: Color(0XFF8D0C00),
  // Define the default Font Family
  fontFamily: 'Montserrat',
  backgroundColor: Color(0xFFFB0605),

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    display4: TextStyle(fontSize: 1.0),
    display3: TextStyle(fontSize: 1.0),
    display2: TextStyle(fontSize: 1.0),
    display1: TextStyle(fontSize: 1.0),
    headline: TextStyle(fontSize: 1.0),
    title: TextStyle(fontSize: 1.0),
    subhead: TextStyle(fontSize: 1.0),
    body2: TextStyle(fontSize: 1.0),
    body1: TextStyle(fontSize: 20.0, color: Colors.black),
    caption: TextStyle(fontSize: 1.0),
    button: TextStyle(fontSize: 25.0, color: Colors.white),
    subtitle: TextStyle(fontSize: 1.0),
    overline: TextStyle(fontSize: 1.0),
  ),
);
