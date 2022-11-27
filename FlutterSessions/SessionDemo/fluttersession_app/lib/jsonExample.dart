
import 'dart:convert';

String jsonData = """ 
{
  "Name":"Student 1",
  "Course":"B.Tech",
  "Stream":"CS",
  "Age": 16,
  "Roll":"ABC123qwe",
  "FavCar":"Mustang"
}
""";

//PODO - Plain Old Dart Object
class StudentData{
  String Name = "";
  String Course ="";
  String Stream = "";
  int Age = 0;

  StudentData({required this.Name,required this.Course,required this.Stream,required this.Age});

  StudentData.empty(); // Named Constructor

  factory StudentData.fromJson(Map<String,dynamic> data){
    final String name = data["Name"] as String;
    final String course = data["Course"] as String;
    final String stream = data["Stream"] as String;
    final int age = data["Age"] as int;

    return StudentData(Name: name, Course: course, Stream: stream, Age: age);
  }

  StudentData getData(){
    final jsonDict = json.decode(jsonData);
    print("Type ${jsonDict.runtimeType} Value = ${jsonDict}");

    return StudentData.fromJson(jsonDict);
  }

  @override
  String  toString(){
    String sd = "Student ${this.Name} ${this.Course} ${this.Stream} Age ${this.Age}";
    return sd;
  }

}

