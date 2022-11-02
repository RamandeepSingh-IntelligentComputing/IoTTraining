
import 'package:flutter/cupertino.dart';

class ColorBox extends StatefulWidget {

  _ColorBoxState cbs = _ColorBoxState();
  _ColorBoxState createState() => cbs;

  Color c1 = Color.fromARGB(255, 255, 0, 0);
  Color c2 = Color.fromARGB(255, 0, 255, 0);
  Color c3 = Color.fromARGB(255, 0, 0, 255);
  Color current = Color.fromARGB(255, 255, 255, 255);
}

class _ColorBoxState extends State<ColorBox>{
  void setColor1()
  {
    setState(() {
      widget.current = widget.c1;
      print("C1 Set");
    });
  }

  void setColor2()
  {
    setState(() {
      widget.current = widget.c2;
      print("C2 Set");
    });
  }

  void setColor3()
  {
    setState(() {
      widget.current = widget.c3;
      print("C3 Set");
    });

  }

  @override
  Widget build(BuildContext context) {

    return( Container(
        color: widget.current,
      ));
  }

}