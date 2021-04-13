import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String id = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Column(
        children: [
          Container(
            child: AddvertCard1(sometext: 'Henm',)
          )
        ],
      )
    );
  }
}
class AddvertCard1 extends StatelessWidget {

  final String sometext;
  final Color colour;
  // final Image img;


  AddvertCard1({this.sometext, this.colour,});

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size.height;
    return  Container(
      height: size * 0.2,
      color: colour,
      margin: EdgeInsets.all(20),
      width: wid *  0.4,
      child: Text(
        sometext,
      ),
    );
  }
}
