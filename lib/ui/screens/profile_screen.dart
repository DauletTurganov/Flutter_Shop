import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/provider.dart';
import 'package:internet_magazin/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
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
                child: Text('Registration',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: kInputDecor,
                onChanged: (value) {
                    _email = value;
                    },
              ),
              SizedBox(
                height: 30.0,
              ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: kInputDecor.copyWith(hintText: 'Enter you password', ),
              onChanged: (value)  {
                _password = value;
              },
            ),
              SizedBox(
                height: 20.0,
              ),
              // TextButton(onPressed: () {}, child: Text(
              //   'Forgot password?'
              // ),),
              ElevatedButton(onPressed: () async{
                  try {
                 final newUser =
                  await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password
                  );
                  print('succes');
                  } on FirebaseAuthException catch(e) {
                  if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                  }
                  } catch (e) {
                  print(e);
                  }

                  // await Provider.of<Registration>(context, listen: false).register(_email, _password);

              }, child: Text('Sign in'))

            ],
          ),
        ),
      ),
    );
  }
}
