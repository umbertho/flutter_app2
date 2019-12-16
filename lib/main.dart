import 'package:flutter/material.dart';
import './ui/welcome_screen.dart';
import './ui/initial_screen.dart';

void main(){
  runApp(

    new MaterialApp(
      title: "title",
      home: new InitialScreen(
          "MyApp",
          "Version X.XX",
          Icons.business_center,
          "orange"),
    )
  );
}