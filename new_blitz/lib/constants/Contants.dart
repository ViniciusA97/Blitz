import 'package:flutter/material.dart';

const kTextFieldDecoraction = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(118, 192, 68, .1), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);