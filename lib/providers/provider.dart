
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:internet_magazin/models/recipeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
        // print(recipe);
        // print(recipe.count);
        // print(recipe.hits.length);
        // print(recipe.hits[0].recipe.label);
        recept = recipe;
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
    if (recept != null) {
      _from = _from + 10;
      _to = _to + 10;
      currentPage++;
    } else {
      print('Recept is null');
    }

    // getData(_searchItems);
}

void previousPage() {
    if (recept != null) {
      if( _from == 0) {
        _from = 0;
        _to = 10;
      } else {
        _from = _from - 10;
        _to = _to - 10;
        currentPage--;
      }
    }

  // getData(_searchItems);
}

// void chosePage() {
//     if (_from > 0) {
//       _from = _from * currentPage * 10;
//       _to = _to * currentPage * 10;
//     }
//
// }

void goToStart() {
    if (recept != null) {
      _from = 0;
      _to = 10;
    }
}

}

class Cart extends ChangeNotifier {

  List<RecipeItems> cart;



}


class Registration extends ChangeNotifier {

  // final _auth = FirebaseAuth.instance;
  // //     .authStateChanges()
  // //     .listen((User user) {
  // //   if (user == null) {
  // //     print('User is currently signed out!');
  // //   } else {
  // //     print('User is signed in!');
  // //   }
  // // });
  //
  //
  //
  // get auth => _auth;
  String _email;
  String _password;
  bool _initialized = false;
  bool userLoggedIn;

  // void setEmail(value) {
  //   _email = value;
  //   print(_email);
  // }
  //
  //
  //
  // void setPassword(value) {
  //   _password = value;
  //   print(_password);
  // }

  // void register(email, password) async{
  //   _email = email;
  //   _password = _password;

  //   try {
  //     UserCredential userCredential =
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _email, password: _password
  //     );
  //       print('succes');
  //   } on FirebaseAuthException catch(e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  // void initializeFlutterFire() async{
  //   try {
  //     // Wait for Firebase to initialize and set `_initialized` state to true
  //     await Firebase.initializeApp();
  //       _initialized = true;
  //
  //   } catch(e) {
  //     // Set `_error` state to true if Firebase initialization fails
  //
  //       print(e);
  //
  //   }
  // }



}