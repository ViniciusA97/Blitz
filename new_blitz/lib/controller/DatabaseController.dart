import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:new_blitz/entities/User.dart';

class DatabaseController {
  
  static final DatabaseController _instance = new DatabaseController.internal();
  factory DatabaseController() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseController.internal();

  
  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate,  onConfigure: _onConfigure);
    return ourDb;
  }

  void _onConfigure(Database db)async {
      await db.execute("PRAGMA foreign_keys = ON");
  }

  Future<Database> getDb() async {
    return await db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY , name TEXT, imgPath TEXT, totalWin INTEGER, maxPointRound TEXT , mediaPointByRound TEXT );");
  }

  Future<bool> saveUser(User user) async {
    var dbClient = await this.getDb();
    await dbClient.insert('User', user.toMap());
    return true;
  }

  Future<User> getUserById(int id) async{
    var dbClient = await getDb();
    var result = await dbClient.query('user',where: '"id" = ?', whereArgs: [id]);
    User user = new User.map(result);
    return user;
  }

  Future<List<User>> getAllUser() async{
    var dbClient = await getDb();
    var result = await dbClient.query('user');
    List<User> list = new List<User>();
    for(var i in result){
      list.add(User.map(i));
    }
    return list;
  }

}
