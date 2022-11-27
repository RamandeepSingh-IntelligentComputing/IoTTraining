
class student{
  String name;
  String collage;

  student(this.name,this.collage);

}

Future<List<String>> FutureMsg () {
  return Future.delayed(Duration(seconds: 10),() {
    List<String> stl123 = List.generate(10, (index) => "Student $index");
    print("Future Msg Completed");
    return stl123;
  });
}