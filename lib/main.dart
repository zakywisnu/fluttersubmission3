import 'package:flutter/material.dart';

import 'view/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Meals',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
