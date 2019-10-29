import 'package:flutter/material.dart';
import 'package:new_blitz/notification/notification.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dutch Blitz',
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
