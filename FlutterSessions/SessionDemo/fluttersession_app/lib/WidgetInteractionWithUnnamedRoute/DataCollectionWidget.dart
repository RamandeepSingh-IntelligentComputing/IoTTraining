import 'package:flutter/material.dart';
import 'package:fluttersession_app/WidgetInteraction/StudentInfoTile.dart';

class DataCollectionWidget extends StatelessWidget{

  late BuildContext cntxt;
  void Function(Widget wdgt) updateList;

  TextEditingController nc = TextEditingController();
  TextEditingController cc = TextEditingController();

  DataCollectionWidget(this.updateList);

  void onAddClick(){
    updateList(StudentInfoTile(nc.text,cc.text));
    Navigator.pop(cntxt);
  }

  @override
  Widget build(BuildContext context) {
    cntxt = context;
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