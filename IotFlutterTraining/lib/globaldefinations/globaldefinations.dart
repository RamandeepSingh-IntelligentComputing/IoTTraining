
class project{
  String projectName="";
  String mentors="";
  String desc = "";



  project({required this.projectName,required this.mentors,required this.desc});

  factory project.fromJson(Map<String,dynamic> parsedJson){
    return project(projectName: parsedJson['projectname'],
        mentors: parsedJson['mentors'], desc: parsedJson['desc']);
  }
}

class studentDetails{
  String name="";
  String init="";
  String course="";
  String college="";
  String branch ="";
  List<String> ? hobby;
  project ? pro;

  studentDetails();

  studentDetails.withData({required this.name,required this.init,
  this.college="",this.branch="",this.course="",this.hobby,required this.pro});

  factory studentDetails.fromJson(Map<String,dynamic>parsedJson){
    return studentDetails.withData(name: parsedJson['name'],
        init: parsedJson['id'],
        hobby: List.from(parsedJson['hobby'],),
        pro:project.fromJson(parsedJson['project'])
    );
  }

  /*static studentDetails dummyFun(Map<String,dynamic>parsedJson){
     return studentDetails.withData(name: parsedJson['name'],
         init: parsedJson['id'],
       hobby: List.from(parsedJson['hobby'])
     );
  }*/

  @override
  String toString()
  {
    return("Name = $name - $init with Hobbies $hobby working on ${pro?.projectName}");
  }

}

String StudentJson = '''
[
  {
    "name":"Test 1",
    "id":"T1",
    "course":"Btech",
    "hobby":["Gaming","Reading","Cricket"],
    "project":{
    "projectname":"Project 1",
    "mentors":"Mentor",
    "desc":"This is a void desc"
    }
  },
  {
    "name":"Test 2",
    "id":"T2",
    "course":"Btech",
    "hobby":["Running","Cricket"],
    "project":{
    "projectname":"Project 2",
    "mentors":"Mentor 2",
    "desc":"This is a void desc"
    }
  },
  {
    "name":"Test 3",
    "id":"T3",
    "course":"Btech",
    "hobby":["Badminton","Reading"],
    "project":{
    "projectname":"Project 3",
    "mentors":"Mentor 3",
    "desc":"This is a void desc"
    }
  }
]
''';

