// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:internet_magazin/models/recipeModel.dart';
//
// class GetRecipe {
//
//   final _APP_ID = 'd5fd1cb9';
//   final _APP_KEY = 'd4be5788cb0ab6aa1249764f362b8fb9';
//
//   List<Recipe> recipies;
//
//   Future <List<Recipe>> getData(searchItem) async {
//
//     print('getData function was invoked');
//
//     http.Response response = await http.get(
//         Uri.https('api.edamam.com', '/search',
//             {
//               'q': searchItem,
//               'app_id': _APP_ID,
//               'app_key': _APP_KEY,
//               'from': '0',
//               'to': '10'
//             }));
//
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//
//       // print(jsonData);
//       if (jsonData['more'] == true) {
//         recipies = [];
//         print(response.statusCode);
//         jsonData['hits'].forEach((e) {
//           Recipe recipe = Recipe(
//             label: e['recipe']['label'].toString(),
//             image: e['recipe']['image'],
//             source: e['recipe']['source'].toString(),
//             // ingredientLines: e['recipe']['ingredientLines']
//             // ingredientLines: e['recipe']['ingredientLines'] as List,
//
//           );
//
//           recipies.add(recipe);
//           print(recipies.length);
//           return recipies;
//         });
//       }
//
//     } else {
//       print(response.statusCode);
//     }
//
//   }
//
//   // List recipies = [];
//   //
//   // Future <List<dynamic>> getData(searchItem) async {
//   //
//   //
//   //   http.Response response = await http.get(
//   //       Uri.https('api.edamam.com', '/search',
//   //           {
//   //             'q': searchItem,
//   //             'app_id': _APP_ID,
//   //             'app_key': _APP_KEY,
//   //             'from': '0',
//   //             'to': '10'
//   //           }));
//   //
//   //   if (response.statusCode == 200) {
//   //     var jsonData = jsonDecode(response.body);
//   //     Map<String, dynamic> values;
//   //     // print(jsonData);
//   //     if (jsonData['more'] == true) {
//   //       jsonData['hits'].forEach((e) {
//   //         RecipeItems recipie = RecipeItems();
//   //         // print(recipie);
//   //         // print(recipies);
//   //       });
//   //     }
//   //
//   //     // print(recipies);
//   //     return recipies;
//   //   } else {
//   //     print(response.statusCode);
//   //   }
//   //
//   //   print(recipies);
//   //   return recipies;
//   // }
//
// }