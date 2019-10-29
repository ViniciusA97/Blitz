

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LocalNotificationState();


}

class _LocalNotificationState extends State<LocalNotification>{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

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
    flutterLocalNotificationsPlugin.show(0, "Test Title", "Test Body", plataform, payload: "Teste payload" );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(child: RaisedButton(onPressed: (){ showNotification();},),),
    );
  }



}