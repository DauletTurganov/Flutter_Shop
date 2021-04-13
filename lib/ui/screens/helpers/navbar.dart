import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_magazin/ui/screens/profile_screen.dart';
import 'package:internet_magazin/ui/screens/search_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.05,
      color: Colors.grey[400],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavIcon(iconName: Icon(CupertinoIcons.home)),
            NavIcon(iconName: Icon(CupertinoIcons.search)),
            NavIcon(iconName: Icon(CupertinoIcons.cart)),
            NavIcon(iconName: Icon(CupertinoIcons.profile_circled)),
            ],
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {


  final Widget iconName;
  NavIcon({ this.iconName});



  @override
  Widget build(BuildContext context) {
    return IconButton(
        hoverColor: Color(0xffA941A9),
        icon: iconName,
        color: Colors.grey[700],
        onPressed:  () {
          Navigator.pushNamed(context, ProfileScreen.id);});
  }
}
