import 'package:flutter/material.dart';


class loginwidget extends StatelessWidget {

  String useremail = "";
  String password = "";

  //TextEditingController email;
  //TextEditingController pass;
  //VoidCallback onLoginClick;
  Function(String,String) onGetData;

  //loginwidget({required this.email,required this.pass,required this.onLoginClick,required this.onGetData});
  loginwidget({required this.onGetData});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(padding: EdgeInsets.all(10),
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(hintText: "Enter Email",
              labelText: "Email"),
            onChanged:(text)=>{useremail=text}),
          TextField(obscureText: true,
            decoration: InputDecoration(labelText: "Password",
            hintText: "Enter Password"),onChanged:(text)=>{password = text}),
          //ElevatedButton(onPressed:onLoginClick,
          //    child: Icon(Icons.login,size: 28,color:Colors.amber,)),
          ElevatedButton(onPressed:()=>{onGetData(useremail,password)},
              child: Icon(Icons.login,size: 28,color:Colors.amber,)),
        ],
      ),),
    );
  }
}

class extendedLoginWidget extends StatelessWidget{
  String inputTxt = "";

  void handleRoot(String email,String pass){
    print("Welcome $email");
  }

  @override
  Widget build(BuildContext context) {

    return (Scaffold(
      appBar: AppBar(title: Text("Welcome to My Page",
        style: TextStyle(fontSize: 38,color:Colors.lightGreen),),),
      body: loginwidget(onGetData:handleRoot),
    ));
  }

}
