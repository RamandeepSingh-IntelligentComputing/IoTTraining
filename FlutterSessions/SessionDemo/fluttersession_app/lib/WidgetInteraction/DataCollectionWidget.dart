import 'package:flutter/material.dart';
import 'package:fluttersession_app/WidgetInteraction/StudentInfoTile.dart';

class DataCollectionWidget extends StatelessWidget{

  void Function(Widget wdgt) updateList;

  TextEditingController nc = TextEditingController();
  TextEditingController cc = TextEditingController();

  DataCollectionWidget(this.updateList);

  void onAddClick(){
    updateList(StudentInfoTile(nc.text,cc.text));
  }

  @override
  Widget build(BuildContext context) {
    return(
      Expanded(child:Column(
        children: [
          TextField(decoration:InputDecoration(hintText: "Name"),controller: nc,),
          TextField(decoration:InputDecoration(hintText: "Course"),controller: cc,),
        ],
      ))
    );
  }

}