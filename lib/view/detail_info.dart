// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterdicoding3/Model/meal.dart';

// class DetailInfo extends StatefulWidget{
//   final List<DetailedMeal> detailedMeal;
//   DetailInfo({Key key, this.detailedMeal}) : super(key: key);

//   @override
//   DetailInfoState createState() => DetailInfoState();
// }

// class DetailInfoState extends State<DetailInfo> {
//   @override
//   void initState() {
//     Future<Null>.delayed(Duration.zero, (){
//       Scaffold.of(context).showSnackBar(
//           SnackBar(content: Text(widget.detailedMeal[0].detailedStrMeal),));
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: <Widget>[
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: 150.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                 shape:BoxShape.circle,
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                     widget.detailedMeal[0].detailedStrMealThumb
//                   )
//                 )
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.only(top:4.0),
//               child: Text(
//                 widget.detailedMeal[0].detailedStrMeal
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.only(top:4.0),
//               child: Text(
//                   widget.detailedMeal[0].detailedStrCategory
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.only(top:4.0),
//               child: Text(
//                 'Ingredients: ',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: ingredientsList(
//                 widget.detailedMeal[0].detailedStrIngredients
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.only(top:4.0),
//               child: Text(
//                 'Instructions: ',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: instructionsList(
//                   widget.detailedMeal[0].detailedStrInstructions
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// List<Padding> ingredientsList(List<String> stringList) {
//   List<Padding> childrenTexts = List<Padding>();

//   for (String string in stringList) {
//     if (string.length > 0) {
//       childrenTexts.add(
//         Padding(
//           // Atur padding di text, yaitu top padding
//           padding: EdgeInsets.only(top: 4.0),
//           // Align object untuk enable text alignment
//           child: Align(
//             alignment: Alignment.centerLeft,
//             // Set text based on container
//             child: Container(
//               child: Text('-) ' + string),
//             ),
//           ),
//         ),
//       );
//     }
//   }
//   return childrenTexts;
// }

// List<Padding> instructionsList(List<String> listString) {
//   List<Padding> instructionTexts = List<Padding>();

//   // Check if member exist in List of String
//   for (String string in listString) {
//     instructionTexts.add(
//       Padding(
//         padding: EdgeInsets.only(top: 4.0),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Container(
//             child: Text('-) ' + string),
//           ),
//         ),
//       ));
//   }
//   return instructionTexts;
// }
