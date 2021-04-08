
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:internet_magazin/models/recipeModel.dart';

import 'dart:convert';

class SearchProvider extends ChangeNotifier {

  static const _APP_ID = 'd5fd1cb9';
  static const _APP_KEY = 'd4be5788cb0ab6aa1249764f362b8fb9';


  String _searchItems;
  String _interSearch;

  List _recipies = [];
  RecipeItems recept;

  int _from = 0;
  int _to = 10;

  int totalPageNumber;

  int currentPage = 1;

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
     String get searchItems => _searchItems;

  UnmodifiableListView get recipies {
    return UnmodifiableListView(_recipies);
  }

  // <List<Recipe>>

  Future getData(searchItem) async {

    print('getData function was invoked and going to search $_searchItems');


    http.Response response = await http.get(
        Uri.https('api.edamam.com', '/search',
            {
              'q': _searchItems,
              'app_id': _APP_ID,
              'app_key': _APP_KEY,
              'from': _from.toString(),
              'to': _to.toString(),
            }));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      // print(jsonData);
      if (jsonData['more'] == true) {
        print(response.statusCode);
        RecipeItems recipe = RecipeItems.fromJson(jsonData);
        print(recipe);
        print(recipe.hits[0].recipe.label);
        // Recipe recipe = Recipe.fromJson(jsonData)
        // jsonData['hits'].forEach((e) {
        //   // Recipe recipe = Recipe(
        //   //   // label: e['recipe']['label'].toString(),
        //   //   // image: e['recipe']['image'],
        //   //   // source: e['recipe']['source'].toString(),
        //   //   // ingredientLines: e['recipe']['ingredientLines']
        //   //
        //   // );
        //   Recipe recipe = Recipe.fromJson(jsonData['hits']['recipe'][e]);
        //   _recipies.add(recipe);
        //   print(recipe.ingredientLines);
        //   print(jsonData['hits']);
        // });
        recept = recipe;
        // _recipies.add(recept);
        // print(_recipies);
        // return _recipies;
      }

    } else {
      print(response.statusCode);
    }


}

  // void printRecipes() {
  //   _recipies.forEach((element) {
  //     print(element.label);
  //   });
  // }

  void addItem(value) {
    if (value != _searchItems) {
      _recipies = [];
      _interSearch = value;
    }
      _interSearch = value;

    notifyListeners();
  }

  void changeSearchItem(){
    _searchItems = _interSearch;
    notifyListeners();
  }

  void nextPage() {
    _from = _from + 10;
    _to = _to + 10;
    currentPage++;
    // getData(_searchItems);
    notifyListeners();
}

void previousPage() {
    if( _from == 0) {
      _from = 0;
      _to = 10;
    } else {
      _from = _from - 10;
      _to = _to - 10;
      currentPage--;
    }
  // getData(_searchItems);
  notifyListeners();
}

void chosePage() {
    if (_from > 0) {
      _from = _from * currentPage * 10;
      _to = _to * currentPage * 10;
    }
}

void goToStart() {
    _from = 0;
    _to = 10;
    notifyListeners();
}

}