import 'package:flutter/material.dart';
import 'package:beauty_navigation/beauty_navigation.dart';
import 'package:flutter/cupertino.dart';

class BeautyNavigator extends StatelessWidget {
  const BeautyNavigator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BeautyNavigation(
      activeIconColor: Colors.deepPurpleAccent,
      inactiveIconColor: Colors.white,
      animationDuration: Duration(milliseconds: 500),
      circleColor: Colors.white,
      backgroundColor: Colors.pinkAccent,
      height: 100,
      items: [
        Items(
          icon: Icon(CupertinoIcons.home),
          tabName: 'Home',
          //TODO: Go Home
          onClick: () {
          },
        ),
        Items(
          icon: Icon(CupertinoIcons.search),
          tabName: 'Search',
          //TODO: add search link
          onClick: () {

          },
        ),
        Items(
          icon: Icon(CupertinoIcons.cart),
          tabName: 'Cart',
          //TODO: Add cart link
          onClick: () {

          },
        ),
        Items(
          icon: Icon(CupertinoIcons.profile_circled),
          tabName: 'Profile',
          //TODO: Do profile screen and add it
          onClick: () {

          },
        ),
      ],
    );
  }
}
