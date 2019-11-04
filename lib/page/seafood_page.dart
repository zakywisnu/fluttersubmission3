
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdicoding3/model/meal.dart';
import 'package:flutterdicoding3/view/detail_screen.dart';
import 'package:flutterdicoding3/service/meal_service.dart';

class SeafoodPage extends StatefulWidget {
  final String mealCategory;
  SeafoodPage({@required this.mealCategory, Key key}) : super(key: key);
  @override
  _SeafoodState createState() => _SeafoodState();
}

class _SeafoodState extends State<SeafoodPage> {
  List<Meal> meals;
  @override
  void initState() {
    super.initState();
    _getMealCategory();
  }

  Future _getMealCategory() async {
    var mealService = MealService();
    var response = await mealService.getMealCategory(widget.mealCategory);
    if (!mounted) return;
    setState(() {
      meals = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildItem(context);
  }

  SafeArea buildItem(BuildContext context) {
    if (meals == null) {
      return SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          key: Key('SEAFOOD_PAGE'),
          body: GridView.builder(
            key: Key('GRIDVIEW_SEAFOOD'),
            itemCount: meals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                key: Key('CARD_SEAFOOD_PAGE_$index'),
                child: Card(
                  margin: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Hero(
                          tag: meals[index].idMeal,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              meals[index].strMealThumb,
                              fit: BoxFit.cover,
                              key: Key('CARD_IMAGE_SEAFOOD_PAGE_$index'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              meals[index].strMeal,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        idMeal: meals[index].idMeal,
                        strMeal: meals[index].strMeal,
                        strMealThumb: meals[index].strMealThumb,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    }
  }
}
