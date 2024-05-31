import 'package:flutter/material.dart';
import 'package:safe_go/screens/Driver/DriverHome.dart';

class Student {
  final String name;
  bool isSelected;

  Student(this.name, this.isSelected);
}

class DriverMessage extends StatefulWidget {
  @override
  _DriverMessageScreenState createState() => _DriverMessageScreenState();
}

class _DriverMessageScreenState extends State<DriverMessage> {
  TextEditingController _messageController = TextEditingController();
  List<Student> _students = List.generate(
    10, // Number of students, you can change this as needed
    (index) => Student('Student ${index + 1}', false),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            "Message",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriverHome(),
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Students:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: _students
                      .map(
                        (student) => FilterChip(
                          label: Text(student.name),
                          selected: student.isSelected,
                          onSelected: (isSelected) {
                            setState(
                              () {
                                student.isSelected = isSelected;
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement the logic for selecting all students
                    setState(
                      () {
                        _students.forEach(
                          (student) {
                            student.isSelected = true;
                          },
                        );
                      },
                    );
                  },
                  child: Text('Select All'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Type your Messages:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child:ListView(
                    children: <Widget>[
                      TextFormField(
                        maxLength: 250,
                        maxLines: 20,
                        controller: _messageController, // Add this line
                        decoration: InputDecoration(hintText: "Message"),
                      ),
                      // Add more ListTile widgets based on the number of messages
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement the logic for sending the message to selected students
                    String message = _messageController.text;
                    List<Student> selectedStudents = _students
                        .where((student) => student.isSelected)
                        .toList();

                    for (Student student in selectedStudents) {
                      print('Sending message to ${student.name}: $message');
                      // Implement the logic to send messages to students
                    }

                    // Add additional logic as needed
                  },
                  child: Text('Send Message'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
