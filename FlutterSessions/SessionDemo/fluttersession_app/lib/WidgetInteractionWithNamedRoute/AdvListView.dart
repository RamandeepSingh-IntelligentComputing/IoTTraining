import 'package:flutter/material.dart';

class AdvListView extends StatefulWidget{

  AdvListViewState advListViewState = AdvListViewState();

  AdvListViewState createState()=> advListViewState;
}

class AdvListViewState extends State<AdvListView>{
  List<Widget> widgetList = [];

  void UpdateList(Widget wdgt){
    setState(() {
      widgetList.add(wdgt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return(
    ListView.builder(itemCount: widgetList.length,
        itemBuilder: (BuildContext cntx,int index){
        return(widgetList[index]);
        })
    );
  }
}