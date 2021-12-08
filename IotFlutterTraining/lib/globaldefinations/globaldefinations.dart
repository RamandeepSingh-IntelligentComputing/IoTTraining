
class studentDetails{
  String name="";
  String init="";
  String course="";
  String college="";
  String branch ="";
  List<String> ? hobby;

  studentDetails();

  studentDetails.withData({required this.name,required this.init,
  this.college="",this.branch="",this.hobby});

  factory studentDetails.fromJson(Map<String,dynamic>parsedJson){
    return studentDetails.withData(name: parsedJson['name'],
        init: parsedJson['id'],
        hobby: List.from(parsedJson['hobby'])
    );
  }

  static studentDetails dummyFun(Map<String,dynamic>parsedJson){
     return studentDetails.withData(name: parsedJson['name'],
         init: parsedJson['id'],
       hobby: List.from(parsedJson['hobby'])
     );
  }

  @override
  String toString()
  {
    return("Name = $name - $init with Hobbies $hobby");
  }

}

String StudentJson = '''
[
  {
    "name":"Test 1",
    "id":"T1",
    "course":"Btech",
    "hobby":["Gaming","Reading","Cricket"]
  },
  {
    "name":"Test 2",
    "id":"T2",
    "course":"Btech",
    "hobby":["Running","Cricket"]
  },
  {
    "name":"Test 3",
    "id":"T3",
    "course":"Btech",
    "hobby":["Badminton","Reading"]
  }
]
''';

