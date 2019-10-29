
import 'package:flutter/material.dart';

import 'menu_team.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list = new List<Map<String, dynamic>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Blitz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Blitz!", style: TextStyle(color: Colors.orange, fontSize: 110, fontStyle: FontStyle.italic),textAlign: TextAlign.center),
             RaisedButton(
               child: Text("Jogar"),
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
               color: Colors.amber,
               onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> MenuTeam(list))
                  );
               },
               

            )
          ],
          
        ),
      ),
      
    );
  }


}
