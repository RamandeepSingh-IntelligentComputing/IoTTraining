
import "package:flutter/material.dart";

class loginPage extends StatelessWidget{

  String userid="";
  String pass ="";

  bool Validate(){
    if(userid.contains("User1") && pass.contains("123qwe"))
      {
        print("Login Successfull");
        return true;
      }
    else {
      print("Login Failed");
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    TextField login = TextField();
    return(
      Material(child:
      Container(
        child:Column(children: [
          Padding(padding:const EdgeInsets.fromLTRB(20, 0,150 , 0),
              child:Row(children:  [const Text("Name"),Expanded( child:
              Padding(padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  child:TextField(
                onChanged: (val)=>{
                  userid=val
                },
              )))],)),
          Padding(padding:const EdgeInsets.fromLTRB(20, 0,150 , 0),
              child:Row(children: [Text("Pass"),Expanded(child:
              Padding(padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child:TextField(obscureText: true,
              onChanged: (val)=>{
                pass = val
              },
              )))],)),
          Padding(padding: EdgeInsets.fromLTRB(300, 100, 50, 20),
            child: ElevatedButton(onPressed: Validate, child: Text("Login"),),)
        ],)
      ))
    );
  }
}