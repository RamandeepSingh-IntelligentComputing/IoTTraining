import 'package:flutter/material.dart';

class futuredemo extends StatefulWidget{
  futuredemostate createState()=> futuredemostate();
}

class futuredemostate extends State<futuredemo>{

  String dummyText ='Dummy Text';

  Future<String> setText() async{
    return Future.delayed(Duration(seconds: 10), (){
      print("set Text Executed");
      return "Async Block Executed";
    });
  }

  void updateText() async {
    dummyText = await setText();
    print("dummyText = $dummyText");
  }

  @override
  void initState()  {
    dummyText ='Dummy Text';

    print("dummyText = $dummyText");

    updateText();

    print("dummyText = $dummyText");
        /*.then((value) => {
      setState(() {
        print("Async block executed");
        dummyText = value;
      })
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("See this works...");

    return(
    Scaffold(

      body:Center(child:Text(dummyText)),
    )

    );

  }

}