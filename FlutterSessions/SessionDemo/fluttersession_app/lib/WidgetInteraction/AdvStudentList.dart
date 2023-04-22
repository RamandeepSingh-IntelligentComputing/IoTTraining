import 'package:flutter/material.dart';
import 'package:fluttersession_app/WidgetInteraction/AdvListView.dart';
import 'package:fluttersession_app/WidgetInteraction/DataCollectionWidget.dart';

class AdvStudentList extends StatelessWidget{

  static AdvListView advListView = AdvListView();
  static DataCollectionWidget dataCollectionWidget = DataCollectionWidget(advListView.advListViewState.UpdateList);

  @override
  Widget build(BuildContext context) {
    return(
    Scaffold(
      body:Column(
        children: [
          Expanded(child:advListView,flex: 3,),
          Expanded(child:dataCollectionWidget)
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: dataCollectionWidget.onAddClick, child: Text("Add"))
      ],
    )
    );
  }

}