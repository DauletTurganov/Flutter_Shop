import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_magazin/ui/screens/cart_screen.dart';
import 'package:internet_magazin/ui/screens/home_page.dart';
import 'package:internet_magazin/ui/screens/portfolio_page.dart';
import 'package:internet_magazin/ui/screens/profile_screen.dart';
import 'package:internet_magazin/ui/screens/search_screen.dart';
import 'package:internet_magazin/ui/screens/showInfo.dart';
import 'package:provider/provider.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/providers/provider.dart';
import 'package:internet_magazin/ui/screens/portfolio_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
        ChangeNotifierProvider<Registration>(create: (context) => Registration())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
          HomePage.id: (context) => HomePage(),
          CartScreen.id: (context) => CartScreen(),
          ShowInfo.id: (context) => ShowInfo(),
          // ProfileScreen.id: (context) => ProfileScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          Portfolio.id: (context) => Portfolio(),
        }
      ),
    );
  }
    }