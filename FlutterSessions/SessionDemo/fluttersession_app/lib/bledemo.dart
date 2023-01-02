

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'Dashboard.dart';

class bleDemo extends StatefulWidget{
  _bleDemoState createState()=>_bleDemoState();

}

class _bleDemoState extends State<bleDemo>{

  String SERVICE_UUID = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"; // UART service UUID
  String CHARACTERISTIC_UUID_RX = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E";
  String CHARACTERISTIC_UUID_TX  = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";

  String bledata = "";
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<String> bleDevices = [];

  @override
  void  initState(){
    super.initState();
    //startScan();
  }

  void startScan() async {
    bleDevices.clear();
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {
      print("Scanning Started");
      for (ScanResult r in results) {
        String devname = r.device.name.length>0 ? r.device.name : r.device.id.toString();

        bleDevices.add(devname);
        print("Ble Device $devname");

      }
    });

    setState(() {
      bleDevices.add("Devices");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          /*Expanded(child: ListView(children: List<Text>.generate(bleDevices.length, (index) => Text("${bleDevices[index]}")),

          )),*/
          StreamBuilder<List<ScanResult>>(
             stream:FlutterBlue.instance.scanResults,
            initialData: [],
            builder: (c, snapshot) => Expanded(child: ListView.builder(itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                title:Text(snapshot.data![index].device.name.length>0 ? snapshot.data![index].device.name : snapshot.data![index].device.id.toString()) ,
                trailing: ElevatedButton(onPressed: ()=>{
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BleDashboard(snapshot.data![index].device);
                  })),
                },child: Text("Connect")),
              );
            }
            ))
          ),
          StreamBuilder<bool>(
            stream: FlutterBlue.instance.isScanning,
            initialData: false,
            builder: (c, snapshot) {
              if (snapshot.data!) {
                return FloatingActionButton(
                  child: Icon(Icons.stop),
                  onPressed: () => FlutterBlue.instance.stopScan(),
                  backgroundColor: Colors.red,
                );
              } else {
                return FloatingActionButton(
                    child: Icon(Icons.search),
                    onPressed: () => startScan());
              }
            },
          )
        ],
      )
    );
  }

}