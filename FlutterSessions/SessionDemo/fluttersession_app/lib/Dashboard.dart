
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleDashboard extends StatefulWidget{
  BluetoothDevice device;

  BleDashboard(this.device);
  
   _BleDashboardState createState() => _BleDashboardState();
}

class _BleDashboardState extends State<BleDashboard>{

  String SERVICE_UUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"; // UART service UUID
  String CHARACTERISTIC_UUID_RX = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E";
  String CHARACTERISTIC_UUID_TX  = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";

  late BluetoothCharacteristic rX;
  late BluetoothCharacteristic tX;
  String bleData = "";

  @override
  void initState(){
    super.initState();
    widget.device.connect().then((value) => discoverServices());
  }

  void discoverServices() async{
    widget.device.discoverServices()
        .then((value) => value.forEach((element) {
      if(element.uuid.toString().contains(SERVICE_UUID.toLowerCase())){
        element.characteristics.forEach((characteristic) {
          print("Characteristic Found ${characteristic.uuid.toString()}");
          if(characteristic.uuid.toString().contains(CHARACTERISTIC_UUID_TX.toLowerCase())){
            print("Tx Characteristic Found");
            tX = characteristic;
            tX.value.listen((value) {
              setState(() {
                bleData = value.toString();
              });
            });
            tX.setNotifyValue(true);
          }
          if(characteristic.uuid.toString().contains(CHARACTERISTIC_UUID_RX.toLowerCase())){
            print("Rx Characteristic Found");
            rX = characteristic;
            //rX.write([1,2,3]);
          }

        });
      }
    }));

  }

  @override
  Widget build(BuildContext context) {
    return(
    Container(
      child: Column(children: [

        Expanded(child: Center(child:Text("Value = $bleData",style: TextStyle(fontSize: 28,color: Colors.deepPurpleAccent),))),

        ElevatedButton(onPressed: ()=>{rX.write(utf8.encode("Hello Esp"))}, child: Text("Send Data"))

      ],),
    )
    );

  }
  
}