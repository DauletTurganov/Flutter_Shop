import 'package:flutter/material.dart';
import 'package:internet_magazin/ui/screens/cart_screen.dart';

class ShowInfo extends StatefulWidget {
  static String id = 'show_info';

  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  Widget ingr;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ingr,
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    },
                    child: Text('Add', style: TextStyle(color: Colors.blue)))
              ],
            )));
  }
}
