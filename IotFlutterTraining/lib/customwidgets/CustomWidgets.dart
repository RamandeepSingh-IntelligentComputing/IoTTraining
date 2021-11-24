import 'package:flutter/material.dart';


class loginwidget extends StatelessWidget {
  String useremail ="";
  String password = "";

  void handleLogin(BuildContext cntx)
  {
    //Fluttertoast.showToast(msg: useremail);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(padding: EdgeInsets.all(10),
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(
            hintText: "Enter Email",
            labelText: "Email"
          ),onChanged:(text)=>{useremail=text} ,),
          TextField(obscureText: true,
            decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter Password"
          ),onChanged:(text)=>{password = text} ,),
          ElevatedButton(onPressed: ()=>{handleLogin(context)},
              child: Icon(Icons.login,size: 28,color:Colors.amber,))
        ],
      ),),
    );
  }
}

class loginwidgetWithController extends StatelessWidget {

  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();

  void handleLogin(BuildContext cntx)
  {
    //Fluttertoast.showToast(msg:tecEmail.text)
    ScaffoldMessenger.of(cntx).showSnackBar(
        SnackBar(content: Text("Welcome ${tecEmail.text}"),duration: Duration(seconds: 3),));
    tecEmail.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(padding: EdgeInsets.all(10),
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Email"
            ),controller: tecEmail),
            TextField(obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password"
              ),controller: tecPass,),
            ElevatedButton(onPressed: ()=>{handleLogin(context)},
                child: Icon(Icons.login,size: 28,color:Colors.amber,)),
          ],
        ),),
    );
  }
}

class extendedLoginWidget extends StatelessWidget{
  Widget login = loginwidgetWithController();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("Welcome to My Page",
        style: TextStyle(fontSize: 38,color:Colors.lightGreen),),),
      body: login,
      drawer: Drawer(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("App Name"),
        Text("Description"),
        Text("ver 1.0.1"),
      ],),

      ),
    ));
  }

}
