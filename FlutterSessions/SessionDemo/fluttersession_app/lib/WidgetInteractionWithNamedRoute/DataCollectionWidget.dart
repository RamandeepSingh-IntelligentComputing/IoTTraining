import 'package:flutter/material.dart';
import 'package:fluttersession_app/WidgetInteraction/StudentInfoTile.dart';

class DataCollectionWidget extends StatelessWidget{

  late BuildContext cntxt;
  //late void Function(Widget wdgt) updateList;

  TextEditingController nc = TextEditingController();
  TextEditingController cc = TextEditingController();

  //DataCollectionWidget(this.updateList);

  void onAddClick(){
    //updateList(StudentInfoTile(nc.text,cc.text));
    Navigator.pop(cntxt,StudentInfoTile(nc.text,cc.text));
  }

  @override
  Widget build(BuildContext context) {
    cntxt = context;
    //updateList = ModalRoute.of(context)!.settings.arguments as void Function(Widget);
    return(Scaffold(
      body:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child:TextField(decoration:InputDecoration(hintText: "Name"),controller: nc,),),
          Expanded(child:TextField(decoration:InputDecoration(hintText: "Course"),controller: cc,),),
          ElevatedButton(onPressed: onAddClick, child: Text("Done"))
        ],
      ))
    );
  }

}