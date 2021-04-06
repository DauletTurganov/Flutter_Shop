import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:internet_magazin/models/recipeModel.dart';
import 'package:internet_magazin/models/recipeModel.dart';
import 'dart:convert';

class SearchProvider extends ChangeNotifier {

  final _APP_ID = 'd5fd1cb9';
  final _APP_KEY = 'd4be5788cb0ab6aa1249764f362b8fb9';


  String searchItems;

  List<Recipe> _recipies;



  // Stream samo() {
  //   StreamSubscription<List> dataSub;
  //
  //   dataSub = getData(searchItems).asStream().listen((event) {
  //
  //   });
  //
  //   dataSub.cancel();
  //
  // }

  UnmodifiableListView get recipies {
    return UnmodifiableListView(_recipies);
  }



  Future <List<Recipe>> getData(searchItem) async {

    print('getData function was invoked and going to search ${searchItems}');


    http.Response response = await http.get(
        Uri.https('api.edamam.com', '/search',
            {
              'q': searchItems,
              'app_id': _APP_ID,
              'app_key': _APP_KEY,
              'from': '0',
              'to': '10'
            }));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      // print(jsonData);
      if (jsonData['more'] == true) {
        _recipies = [];
        print(response.statusCode);
        jsonData['hits'].forEach((e) {
          Recipe recipe = Recipe(
            label: e['recipe']['label'].toString(),
            image: e['recipe']['image'],
            source: e['recipe']['source'].toString(),
            ingredientLines: e['recipe']['ingredientLines']

          );
          _recipies.add(recipe);
          print(recipe.ingredientLines);
          print(jsonData['hits']);
          return _recipies;
        });
      }

    } else {
      print(response.statusCode);
    }


}

  void printRecipes() {
    _recipies.forEach((element) {
      print(element.label);
    });
  }

  void addItem(value) {
    searchItems = value;
    notifyListeners();
  }





}