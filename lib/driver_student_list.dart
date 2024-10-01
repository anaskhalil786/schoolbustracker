import 'package:flutter/material.dart';

class DriverStudentListScreen extends StatelessWidget {
  final List<String> students;

  DriverStudentListScreen({required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Students'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index], style: TextStyle(color: Colors.white)),
          );
        },
      ),
      backgroundColor: Color(0xFF0C2544),
    );
  }
}
