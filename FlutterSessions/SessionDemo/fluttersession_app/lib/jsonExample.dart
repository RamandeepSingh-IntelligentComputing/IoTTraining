
import 'dart:convert';

String jsonData = """ 
[
{
  "Name":"Student 1",
  "Course":"B.Tech",
  "Stream":"CS",
  "Age": 16,
  "Roll":"ABC123qwe",
  "FavCar":"Mustang",
  "Hobbies":["Singing","Reading","Football"]
},
{
  "Name":"Student 2",
  "Course":"B.Tech",
  "Stream":"IT",
  "Age": 17,
  "Roll":"ZCD343rtr",
  "FavCar":"Bentley",
  "Hobbies":["Swimming","Reading","Movies"]
},
{
  "Name":"Student 3",
  "Course":"B.Tech",
  "Stream":"ECE",
  "Age": 17,
  "Roll":"HDGFROS45",
  "FavCar":"Mini",
  "Hobbies":["Lyricist","Music","Cooking"]
}
]
""";

//PODO - Plain Old Dart Object
class StudentData{
  String Name = "";
  String Course ="";
  String Stream = "";
  String FavCar = "";
  int Age = 0;

  StudentData({required this.Name,required this.Course,required this.Stream,
    required this.Age,required this.FavCar});

  StudentData.empty(); // Named Constructor

  factory StudentData.fromJson(Map<String,dynamic> data){
    final String name = data["Name"] as String;
    final String course = data["Course"] as String;
    final String stream = data["Stream"] as String;
    final String favcar = data["FavCar"] as String;
    final int age = data["Age"] as int;

    return StudentData(Name: name, Course: course, Stream: stream, Age: age,FavCar: favcar);
  }

  StudentData getData(){
    final jsonDict = json.decode(jsonData);
    print("Type ${jsonDict.runtimeType} Value = ${jsonDict}");

    return StudentData.fromJson(jsonDict[0]);
  }

  List<StudentData> getStudentList(){
    final jsonDict = json.decode(jsonData);
    print("Type ${jsonDict.runtimeType} Value = ${jsonDict}");

    List<StudentData> studentlist = List<StudentData>.generate(jsonDict.length,
            (index) => StudentData.fromJson(jsonDict[index]));

    return studentlist;

  }

  @override
  String  toString(){
    String sd = "Student ${this.Name} ${this.Course} ${this.Stream} "
        "Age ${this.Age} Favcar ${this.FavCar}";
    return sd;
  }

}

