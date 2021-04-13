import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/provider.dart';
import 'package:internet_magazin/constants.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff696969),
      ),
      body:
          Container(
            color: Color(0xff676767),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 45.0),
                child: Text('Sign in',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: kInputDecor,
                onChanged: (value) {

                    },
              ),
              SizedBox(
                height: 40.0,
              ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: kInputDecor.copyWith(hintText: 'Enter you password'),
              onChanged: (value) {

              },
            ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(onPressed: () {}, child: Text(
                'Forgot password?'
              ),),
              ElevatedButton(onPressed: () {}, child: Text('Sign in'))

            ],
          ),
        ),
      ),
    );
  }
}
