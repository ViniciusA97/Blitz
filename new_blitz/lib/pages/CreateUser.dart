import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_blitz/constants/Contants.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'dart:io' show File;

import 'package:new_blitz/pages/CameraPage.dart';


class CreateUser extends StatefulWidget{
 
  State<StatefulWidget> createState() => _CreateUserState();

}

class _CreateUserState extends State<CreateUser>{

  final scafolldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  var _img;
  bool _hasFile = false;

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  @override
  void initState() {
  }

 
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void _initCamera() async{
    var filePath = await Navigator.push(context,
        MaterialPageRoute(builder: (context)=> CameraPage())
    );
    print("[CONSOLE][IMG-PATH-RETURN]: "+filePath);
    setState(() {
      if(filePath != ""){
        print("[CONSOLE][HAVE PATH OF IMG]");
        _img= filePath;
        _hasFile = true; 
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:createWidget(),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        ),
    );
  }

  Widget createWidget(){
    return 
    Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(onPressed: () async{
                _initCamera();                
              }, child: 
              Container(
                    child: _hasFile? 
                    CircleAvatar(
                      backgroundColor: currentColor,
                      child: CircleAvatar(
                        backgroundImage: Image.file(new File(_img)).image,
                        radius: 50,
                      ),
                      radius: 55,
                      ) 
                    : CircleAvatar(
                        radius: 55,
                        backgroundColor: currentColor,
                        child: CircleAvatar(
                          backgroundImage: Image.asset("./assets/person-icon.png").image,
                          radius: 50,
                        ),
                      )
                  ),),
              Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 10)),
              TextField(
                decoration: kTextFieldDecoraction.copyWith(hintText: 'name'),
              ),
              Padding(padding: EdgeInsets.only(top:10)),
              RaisedButton(
                child: Text("Escolha sua cor"),
                onPressed: (){this.openDialog();},
              ),
              Padding(padding: EdgeInsets.only(top:10)),
              RaisedButton(
                child: Text("Criar"),
                onPressed: (){print('Criar user');},
              )
            ],
          ),
        ),
      );
  }

  void openDialog(){
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Escolha sua cor'),
        content: SingleChildScrollView(
         child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Escolher'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              print('[CONSOLE][PICKED-COLOR]'+ currentColor.toString());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }




}