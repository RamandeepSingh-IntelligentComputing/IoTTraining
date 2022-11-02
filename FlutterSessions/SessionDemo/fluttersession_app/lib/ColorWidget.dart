import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersession_app/ColorBar.dart';
import 'package:fluttersession_app/ColorBox.dart';

class ColorWidget extends StatelessWidget{

  ColorBox Cb = ColorBox();

  @override
  Widget build(BuildContext context) {
    return(
    Container(
      child:Column(
        children: [
          Expanded(child: Cb),
          ColorBar(Red: Cb.cbs.setColor1, Blue: Cb.cbs.setColor2,
              Green: Cb.cbs.setColor3,)
          //ColorBar(Red: Red, Blue: Blue, Green: Green)
        ],
      )
    )
    );
  }

}