import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotfluttertraining/customwidgets/ListViewDemo.dart';
import 'package:iotfluttertraining/customwidgets/StateFullDemo.dart';
import 'customwidgets/CustomWidgets.dart';


void main() {
  runApp(MaterialApp(
    home: entryForm(),
  ));
}


/*
class rootWidget extends StatelessWidget{
  @override
  build(BuildContext context){
    return Container(
      color:Colors.lightBlueAccent,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myRowWidget("Toast For All..!"),
          myRowWidget("Toast For Only Few"),
          myRowWidget("Toast for None..!")
        ],
      )
    );
  }
}

class myRowWidget extends StatelessWidget
{
  myRowWidget(String m){
    msg = m;
  }

  String msg="";
  @override
  Widget build(BuildContext context) {
    return(
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Toast it",
              style: TextStyle(fontSize: 28,
                  decoration: TextDecoration.none),),
            ElevatedButton(
                child: Text("Click Me"),
                onPressed: ()=>Fluttertoast.showToast(msg: msg))
          ],
        )
    );

  }

}


/*class rootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return(
     MaterialApp(
       home: Container(
         color: Colors.white,
         child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
           Text("Toast it",
             style: TextStyle(fontSize: 28,decoration: TextDecoration.none),),
           ElevatedButton(child: Text("Click"),
           onPressed: ()=>Fluttertoast.showToast(msg: "Toast to All"))

         ],),
       ),)
     );
  }
}*/

/*Widget getrootwidget() {
  return Container(
    color: Colors.amberAccent,
    child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child:
          Center(child:Text("Flutter is Easy..!",
            style: TextStyle(fontSize: 28),
            textDirection: TextDirection.ltr,)),
        )),
  );
}*/

/*void main() {
  runApp(Container(
      color: Colors.amberAccent,
      child: Center(
          child: Container(
            color: Colors.lightBlue,
            width: 200.0,
            height: 200.0,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: Text("Hello World", textDirection: TextDirection.ltr),
            )),
      ))));
}*/

/*class firstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(
            "My First App",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
*/
*/