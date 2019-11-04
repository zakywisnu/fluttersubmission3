import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutterdicoding3/model/meal.dart';

class MealService{
  String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  getMealCategory(String mealCategory) async{
    String url = "$baseUrl/filter.php?c=$mealCategory";
    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);

    if(response.statusCode == 200){
      if(response.body == '{"meals":null'){
        return throw Exception('No Meals Avalaiable');
      } else{
        return (responseJson['meals'] as List)
        .map((p) => Meal.fromJson(p)).toList();
      }
    } else{
      throw Exception('Failed to load');
    }
  }

  getMealId(String idMeal) async{
    String url = "$baseUrl/lookup.php?i=$idMeal";
    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);

    if(response.statusCode == 200){
      if(response.body == '{"meals":null'){
        return throw Exception('No Meals Avalaiable');
      } else{
        return (responseJson['meals'] as List)
        .map((p) => DetailedMeal.fromJson(p)).toList();
      }
    } else{
      throw Exception('Failed to load');
    }
  }
}