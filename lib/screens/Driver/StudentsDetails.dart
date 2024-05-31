import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;
  final String school;

  Student({required this.name, required this.age, required this.school});
}

class SDetails extends StatefulWidget {
  const SDetails({Key? key}) : super(key: key);

  @override
  State<SDetails> createState() => _SDetailsState();
}

class _SDetailsState extends State<SDetails> {
  // List of 10 students
  final List<Student> students = [
    Student(name: "sadaruwan", age: 12, school: "rahula matara"),
    Student(name: "kavisha", age: 23, school: "matara School"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Student Details'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Name: ${students[index].name}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              'Age: ${students[index].age}\nSchool: ${students[index].school}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
