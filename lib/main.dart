import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga_ui/screens/main_screen.dart';
import 'package:manga_ui/util/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      home: MainScreen(),
    );
  }
}