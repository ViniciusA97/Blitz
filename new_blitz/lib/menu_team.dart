import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'add_team.dart';
import 'on_game.dart';

class MenuTeam extends StatefulWidget{
 
  List<Map<String, dynamic>> _savedList ;
  MenuTeam(List<Map<String, dynamic>> a){ _savedList =a;}

  State<StatefulWidget> createState() => _MenuTeamState(_savedList);

}

class _MenuTeamState extends State<MenuTeam>{


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<Map<String,dynamic>> _list;
  int _index= 0;
  _MenuTeamState(List a){
    _list = a;
  }

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid = new AndroidInitializationSettings('icon_blitz');
    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: selectNotification);

  }

  Future selectNotification(String payload){
    print('heloo');
  }

  void showNotification(){
    var android = AndroidNotificationDetails("channelId", "channelName", "channelDescription");
    var ios = IOSNotificationDetails();
    var plataform = new NotificationDetails(android, ios);
    for(var i in _list){
      for(var j=0; j<10;j++){
        i['point'].add(0);
      }
    }

    flutterLocalNotificationsPlugin.show(0, "Blitzzz", "O jogo foi iniciado", plataform, payload: "Teste payload" );
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> OnGame(_list)));
  }
 
  void _update(){
    print("teste");
    setState(() {
      _list.removeAt(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu de times"),
      ),
      body: createWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=> AddTeam(_list))
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        
      ),
    );
  }

  Widget createWidget(){
    return 
    Container(
      child:ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, index){
          
          if(_list.isEmpty){
            return 
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child:  Text("Sem times", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),));
          }
          else if(index+1==_list.length && index>=2){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[

                Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),),
              Container(
                width: 300,
                height: 60,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),),
                  color: _list[index]['color'],
                  child: ListTile(
                    title: Text("${_list[index]['name']}",textAlign: TextAlign.center, style: TextStyle(fontSize: 30),),
                    onLongPress: (){
                      _index= index;
                      _update();
                    },
                  ),
                ) ,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                color: Colors.orange,
                onPressed: (){
                  showNotification();
                },
                child: Text("Play"),
              ),
            ],
          );
        }
        return
          Column( 
            mainAxisAlignment: MainAxisAlignment.center,   
            children:<Widget>[ 
              Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),),
            
              Container(
                width: 300,
                height: 60,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),),
                  color: _list[index]['color'],
                  child: ListTile(
                    title: Text("${_list[index]['name']}",textAlign: TextAlign.center, style: TextStyle(fontSize: 30),),
                    onLongPress: (){
                      _index= index;
                     _update();
                    },
                  ),
                ) ,
              ),
            ]);
          },
        ),
      );
    }

}