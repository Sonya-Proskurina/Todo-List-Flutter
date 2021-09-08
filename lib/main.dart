import 'package:flutter/material.dart';
import 'package:todo_list_flatter/pages/Home.dart';
import 'package:todo_list_flatter/pages/MainScrin.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  initialRoute: '/',
  routes: {
    '/' : (context) => MainScrin(),
    '/todo': (context) => Home(),
  },
)
);