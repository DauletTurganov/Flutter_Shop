

import 'package:flutter/material.dart';
import 'package:internet_magazin/constants.dart';


class Portfolio extends StatelessWidget {
  static String id = 'portfolio';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff4eee8),
      drawer: Drawer(

      ),
      appBar: AppBar(
        title: Text(
          'Portfolio app',
        ),
        backgroundColor: Color(0xff325288),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                                   radius: 65,         ),
                      Text(
                        'Daulet Turganov',
                        style: TextStyle(
                          fontSize: 30.0
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness',
style: kBeatifulText,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(' My skills ',
                      style: kBeatifulText.copyWith(fontSize: 24.0, color: Color(0xff51c4d3))
                        ,),

                    ],
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
