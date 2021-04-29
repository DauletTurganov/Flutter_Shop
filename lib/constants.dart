// CB11AB
// 481173
// 8B1190
// A941A9

import 'package:flutter/material.dart';

const kInputDecor = InputDecoration(
  hintText: 'Enter your email',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0),),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

const kBeatifulText = TextStyle(
  fontSize: 20,
  color: Color(0xff114e60),
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);