import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTeste{

  static NotificationTeste  _notification;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;



  _NotificationTeste(){

    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = new AndroidInitializationSettings('icon_blitz');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: selectNotification);

  }

  static NotificationTeste getInstance(){
    
    if(_notification==null) _notification = new NotificationTeste();
    return _notification;
  }

  Future selectNotification(String payload){
    print('heloo');
  }

  void showNotification(){
    var android = AndroidNotificationDetails("channelId", "channelName", "channelDescription");
    var ios = IOSNotificationDetails();
    var plataform = new NotificationDetails(android, ios);
    _flutterLocalNotificationsPlugin.show(0, "title", "body", plataform, payload: "" );
    
  
  }




}