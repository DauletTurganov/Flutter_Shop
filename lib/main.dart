import 'package:flutter/material.dart';
import 'package:internet_magazin/ui/screens/cart_screen.dart';
import 'package:internet_magazin/ui/screens/home_page.dart';
import 'package:internet_magazin/ui/screens/profile_screen.dart';
import 'package:internet_magazin/ui/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:internet_magazin/ui/screens/helpers/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
          HomePage.id: (context) => HomePage(),
          CartScreen.id: (context) => CartScreen(),
          ProfileScreen.id: (context) => CartScreen(),
          SearchScreen.id: (context) => SearchScreen(),
        }
      ),
    );
  }
    }