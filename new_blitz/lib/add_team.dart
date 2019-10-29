import 'package:flutter/material.dart';
import 'package:new_blitz/menu_team.dart';
import 'package:toast/toast.dart';

class AddTeam extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _AddTeamState(_list);

  List<Map<String, dynamic>> _list;
  
  AddTeam(List<Map<String, dynamic>> lista){
    _list = lista;
  }

  
}
class _AddTeamState extends State<AddTeam>{

  TextEditingController _control = TextEditingController();
  List<Map<String , dynamic>> _listState;
  int _gv;
 
  _AddTeamState(List<Map<String, dynamic>> lista){
    _listState = lista;
  }
  Color _color = Colors.white;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionando time"),
      ),
      body: createTeam(),
    );
  }

  Widget createTeam(){
    bool a = true;
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 170,
          height: 100,
          child: TextFormField(
          controller: _control,
          decoration: InputDecoration(labelText: "Nome do time", ),
          ),
        ),

        Row(
          children: <Widget>[

            new Radio(
              activeColor: Colors.red,
              onChanged: (int i)=> mudaCor(i),
              value: 1,
              groupValue:_gv

            ),

            new Radio(
              activeColor: Colors.blue,
              onChanged: (int i)=> mudaCor(i),
              value: 2,
              groupValue:_gv
            ),

            new Radio(
              activeColor: Colors.green,
              onChanged: (int i)=> mudaCor(i),
              value: 3,
              groupValue:_gv
            ),

            new Radio(
              activeColor: Color.fromRGBO(255, 203, 219, 1),
              onChanged: (int i)=> mudaCor(i),
              value: 4,
              groupValue:_gv
            ),

            new Radio(
              activeColor: Colors.yellow,
              onChanged: (int i)=> mudaCor(i),
              value: 5,
              groupValue:_gv
            ),

            new Radio(
              activeColor: Colors.brown,
              onChanged: (int i)=> mudaCor(i),
              value: 6,
              groupValue:_gv
            ),

            new Radio(
              activeColor: Colors.grey,
              onChanged: (int i)=> mudaCor(i),
              value: 7,
              groupValue:_gv
            ),
          ]
        ),
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: RaisedButton(
              child: Text("Criar"),
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),),
              onPressed: (){
                for(var i in _listState){
                  if(i['color']==_color || i['name']==_control.text){
                    Toast.show("Cor ou nome ja usado, escolha outro.", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                    a=false;
                  }
                }
                if(a){
                  addTeam();
                }
              }
              ,
            ),
        )
    
      ],

    );
  }

  void mudaCor(int i){
    setState(() {
     if(i==1){
       _gv=1;
       _color=Colors.red;
     }else if(i==2){
       _gv=2;
       _color = Colors.blue;
     }else if(i==3){
       _gv=3;
       _color = Colors.green;
     }else if(i==4){
       _gv=4;
       _color = Color.fromRGBO(255, 203, 219, 1);
     }else if(i==5){
       _gv=5;
       _color = Colors.yellow;
     }else if(i==6){
       _gv=6;
       _color = Colors.brown;
     }else if(i==7){
       _gv=7;
       _color = Colors.grey;
     }     
    });
  }

  void addTeam(){
    print("$_color  ${_control.text}");
    print(_control.text);
    if(_color == null && _control.text==null){
      return;


    }
    
    Map<String, dynamic> usual = {

      "color" : _color,
      "name" : _control.text,
      "point" : new List<int>()
    };
    _listState.add(usual);
    Navigator.pop(context,_listState);
  }

  Color getColor(int e){

    

  }
  
}