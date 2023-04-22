import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fluttersession_app/WidgetInteractionWithNamedRoute/AdvListView.dart';
import 'package:fluttersession_app/WidgetInteractionWithNamedRoute/DataCollectionWidget.dart';

class AdvStudentList extends StatelessWidget{
  late BuildContext cntxt ;
  static AdvListView advListView = AdvListView();
  //static DataCollectionWidget dataCollectionWidget = DataCollectionWidget(advListView.advListViewState.UpdateList);

  void Navigateto() async{
    final wdgt = await Navigator.pushNamed(cntxt, '/DataCollection');
    advListView.advListViewState.UpdateList(wdgt as Widget);
  }

  @override
  Widget build(BuildContext context) {
    cntxt = context;
    return(
    Scaffold(
      body:Column(
        children: [
          Expanded(child:advListView,flex: 3,),
          //Expanded(child:dataCollectionWidget)
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: Navigateto, child: Text("Add"))
      ],
    )
    );
  }

}