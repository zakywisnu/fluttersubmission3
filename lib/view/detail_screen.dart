import 'package:flutterdicoding3/service/meal_service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdicoding3/model/meal.dart';

class DetailScreen extends StatefulWidget {
  final String idMeal, strMeal, strMealThumb;

  DetailScreen({
    @required this.idMeal,
    @required this.strMeal,
    @required this.strMealThumb,
    Key key,
  }) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<DetailedMeal> mealDetail;

  @override
  void initState() {
    super.initState();
    _getMealId();
  }

  Future _getMealId() async {
    var foodService = MealService();
    var response = await foodService.getMealId(widget.idMeal);
    if (!mounted) return;
    setState(() {
      mealDetail = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.strMeal),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Hero(
                        tag: widget.idMeal,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/image/github.png',
                          image: widget.strMealThumb,
                        ),
                      ),
                    ),
                    detail()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  detail() {
    if (mealDetail == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Ingredients: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: ingredientsList(mealDetail[0].strIngredients),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Instructions: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: instructionsList(mealDetail[0].strInstructions),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}