import 'package:flutter/material.dart';
import 'package:flutterdicoding3/page/dessert_page.dart';
import 'package:flutterdicoding3/page/seafood_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterdicoding3/utils/constant.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealScreen(
        // key: Key('MEAL_SCREEN'),
      ),
    );
  }
}

class MealScreen extends StatefulWidget {
  MealScreen({Key key}) : super(key: key);
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widget = <Widget>[
    DessertPage(mealCategory: dessert),
    SeafoodPage(mealCategory: seafood),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('APP_BAR'),
        title: Text(
          'Meal Catalogue',
        ),
      ),
      body: _widget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.birthdayCake,
            ),
            title: Text('Dessert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fish,
            ),
            title: Text('Seafood'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
