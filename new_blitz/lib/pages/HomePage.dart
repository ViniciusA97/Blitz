
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:new_blitz/pages/CreateUser.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list = new List<Map<String, dynamic>>();

  final PermissionHandler _permissionHandler = PermissionHandler();

  void _requestPermission(PermissionGroup permission) async{
    await _permissionHandler.requestPermissions([permission]);
  }

  @override
  void initState() {
    asyncFunc();
    super.initState();
  }

  void asyncFunc() async {
      this._requestPermission(PermissionGroup.storage);
    
  }

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
                    MaterialPageRoute(builder: (context)=> CreateUser())
                  );
               },
               

            )
          ],
          
        ),
      ),
      
    );
  }


}
