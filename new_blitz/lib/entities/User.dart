import 'package:new_blitz/abstract/ToMap.dart';

class User extends ToMap{

  int _id;
  String _name;
  String _imgPath;
  int _totalWin;
  int _maxPointRound;
  double _mediaPointByRound;

  User(this._id,this._name, this._imgPath, this._maxPointRound, this._totalWin, this._mediaPointByRound);

  String get name => this._name;
  String get img => this._imgPath;
  int get id => this._id;
  int get totalWins => this._totalWin;
  int get maxPointRound => this._maxPointRound;
  double get mediaPoints => this._mediaPointByRound;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> temp;
    temp['id'] = _id;
    temp['name'] = _name;
    temp['imgPath'] = _imgPath;
    temp['totalWin'] = _totalWin;
    temp['maxPointRound'] = _maxPointRound;
    temp['mediaPointByRound'] = _mediaPointByRound;
    return temp;
  }

   User.map(dynamic obj) {
    this._name = obj['name'] ;
    this._id = obj['id'];
    this._imgPath = obj['imgPath'];
    this._totalWin = obj['totalWin'];
    this._maxPointRound = obj['maxPointRound'];
    this._mediaPointByRound = obj['mediaPointByRound'];
  }

}