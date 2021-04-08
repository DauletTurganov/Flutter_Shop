import 'package:flutter/material.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/ui/screens/helpers/searchBar.dart';

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
