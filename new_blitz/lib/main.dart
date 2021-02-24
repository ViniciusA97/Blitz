import 'package:flutter/material.dart';
import 'package:new_blitz/pages/HomePage.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dutch Blitz',
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
