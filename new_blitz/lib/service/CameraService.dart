import 'dart:io' show File;

class FileService{


  String _imagePath;
  File _imageFile;   

  
  File get imageFile => _imageFile;
  String get imagePath => _imagePath;

  void imageByGalery(String path){
    this._imagePath = path;
    this._imageFile = new File(path);
  }



}