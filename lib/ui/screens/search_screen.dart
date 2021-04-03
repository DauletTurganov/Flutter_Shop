import 'package:flutter/material.dart';
import 'package:internet_magazin/models/searchBar.dart';
import 'package:internet_magazin/models/navbar.dart';

class SearchScreen extends StatelessWidget {
  static String id = 'search_screen';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SearchBar(size: size, searchText: 'Catalogue',),
          IconButton(icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pop(context);}
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //     child: navBar()),
        ],
      ),
    );
  }
}
