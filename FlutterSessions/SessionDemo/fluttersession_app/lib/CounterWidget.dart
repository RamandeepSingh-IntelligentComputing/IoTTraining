
import 'package:flutter/cupertino.dart';

class CounterWidget extends StatefulWidget{
  _CounterWidgetState cws = _CounterWidgetState();
  _CounterWidgetState createState() => cws;
  int count = 0;
}

class _CounterWidgetState extends State<CounterWidget>{
  incr(){
    /*setState(() {
      widget.count++;
    });*/
    print("Incr called");
  }

  decr(){
    /*setState(() {
      widget.count--;
    });*/
    print("Decr called");
  }

  @override
  Widget build(BuildContext context) {
   return(
   Container(
     child:Center(child:Text("${widget.count}",style: TextStyle(fontSize: 38),))
   )
   );
  }

}