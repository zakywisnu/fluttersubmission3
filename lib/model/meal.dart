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
  final String idMeal,
      strMeal,
      strCategory,
      strMealThumb,
      strIngredients,
      strInstructions;

  DetailedMeal(
      {this.idMeal,
      this.strCategory,
      this.strIngredients,
      this.strInstructions,
      this.strMeal,
      this.strMealThumb});
  factory DetailedMeal.fromJson(Map<String, dynamic> json) {
    return DetailedMeal(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strMealThumb: json['strMealThumb'],
        strIngredients: json['strIngredients'],
        strInstructions: json['strInstructions']);
  }
}
