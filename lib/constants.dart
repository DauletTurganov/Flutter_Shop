// CB11AB
// 481173
// 8B1190
// A941A9

import 'package:flutter/material.dart';

const kInputDecor = InputDecoration(
  hintText: 'Input your email',
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