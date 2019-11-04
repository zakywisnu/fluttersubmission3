import 'package:flutter/material.dart';

class Meal {
  final String idMeal, strMeal, strMealThumb;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
  });
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }
}

class DetailedMeal {
  String idMeal,
      strMeal,
      strCategory,
      strMealThumb;
  List<String> strIngredients, strInstructions;

  DetailedMeal(
      {this.idMeal,
      this.strCategory,
      this.strIngredients,
      this.strInstructions,
      this.strMeal,
      this.strMealThumb});
  factory DetailedMeal.fromJson(Map<String, dynamic> json){
    List<String> ingredients = List<String>();
    for (int i=1; i<= 20; i++){
      String ingredient = json['strIngredient$i'] as String;
      if(ingredient == null){
        ingredient = "";
      }
      ingredients.add(ingredient);
    }
    List<String> instructions = List<String>();
    String fullInstructions = json['strInstructions'] as String;

    instructions = fullInstructions.split("\r\n");


    return DetailedMeal(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strCategory: json['strCategory'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strIngredients: ingredients,
      strInstructions: instructions
    );
  }
}


List<Padding> ingredientsList(List<String> stringList) {
  List<Padding> childrenTexts = List<Padding>();

  for (String string in stringList) {
    if (string.length > 0) {
      childrenTexts.add(
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('-) ' + string),
            ),
          ),
        ),
      );
    }
  }
  return childrenTexts;
}

List<Padding> instructionsList(List<String> listString) {
  List<Padding> instructionTexts = List<Padding>();

  for (String string in listString) {
    instructionTexts.add(Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text('-) ' + string),
        ),
      ),
    ));
  }
  return instructionTexts;
}
