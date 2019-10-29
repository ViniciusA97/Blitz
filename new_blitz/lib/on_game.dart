import 'package:flutter/material.dart';

class OnGame extends StatefulWidget{
  
  List<Map<String, dynamic>> _listGame;

  OnGame(List<Map<String , dynamic>> lista){
    _listGame = lista;
  }
  
  @override
  State<StatefulWidget> createState() => _OnGameState(_listGame);

}

class _OnGameState extends State<OnGame>{

  List<Map<String, dynamic>> _list;
  TextEditingController _control;

  _OnGameState(List<Map<String, dynamic>> map){
    _control = new TextEditingController();
    _list = map;
  }


  




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Contagem'),
      ),
      body:
        
              createWidget() ,
            
          
        
    );
  }

  Widget createWidget(){

    return 
    
        
        GridView.builder(
          
          itemCount: _list.length*10+_list.length+_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _list.length),
          itemBuilder: (BuildContext context, int index) {
            if(index<_list.length){
              return 
                Card(
                  child: Center(
                    child:Text("${_list[index]['name']}",textAlign: TextAlign.center)
                    ),
                  color: _list[index]['color'],
                );
            }if(index>=_list.length*10+_list.length){
              return Container(
                width: 200,
                color: Colors.black,
              );

            }

            return 
            Card(
              color: _list[index%_list.length]['color'],
              child: 
              Center(child: ListTile(
                title: Text("${_list[index%_list.length]['point'][index%10]}",textAlign: TextAlign.center,),
                
                onTap: (){
                  showDialogInt(index);
                  },
                
                ),)
              
              );
            
          }
    );
 
       
    }
     showDialogInt(int a)  {
      showDialog(context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Add score"),
                        content: TextFormField(
                          decoration: InputDecoration(
                            hintText: "point"
                          ),
                          controller: _control,
                          textInputAction: TextInputAction.done,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: _list[a%_list.length]['color'],
                        actions: <Widget>[
                          FlatButton(child: Text("add"),
                          onPressed: (){
                            _list[a%_list.length]['point'][a%10]=int.parse(_control.text);
                            _control.clear();
                            Navigator.pop(context);
                          },
                          )
                        ],
                      );
                    });
    }
   
}