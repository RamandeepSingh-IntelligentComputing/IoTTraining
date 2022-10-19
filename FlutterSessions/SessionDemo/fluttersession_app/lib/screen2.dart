import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersession_app/globalDef.dart';

class screen2 extends StatelessWidget{
  student st;
  screen2(this.st);

  @override
  Widget build(BuildContext context) {

    return(
        Scaffold(appBar: AppBar(title: Text('Screen 2'),),
          body: Container(child:Center(child:Column(children: [
            Expanded(child: Center(child:Text('Name - ${st.name}')),),
            Expanded(child: Center(child:Text('College - ${st.collage}')),),
            ElevatedButton(onPressed: (){
              st.name = "Mr.${st.name}";
              Navigator.pop(context,st);
            },child: Text('Back'),  )
          ],)
             )),
        )
    );
  }

}