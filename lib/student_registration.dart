import 'package:flutter/material.dart';

class StudentRegistrationScreen extends StatefulWidget {
  final void Function(String) onAddStudent;

  StudentRegistrationScreen({required this.onAddStudent});

  @override
  _StudentRegistrationScreenState createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController grNumberController = TextEditingController();
  final TextEditingController vanNumberController = TextEditingController();
  String selectedDriver = 'Driver 1'; // Initialize with a default value
  List<String> drivers = [
    'Driver 1',
    'Driver 2',
    'Driver 3'
  ]; // Replace with actual driver data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildTextField('Name', nameController),
            buildTextField('Class', classController),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Driver Name'),
              value: selectedDriver,
              onChanged: (newValue) {
                setState(() {
                  selectedDriver = newValue!;
                });
              },
              items: drivers.map((driver) {
                return DropdownMenuItem(
                  child: Text(driver),
                  value: driver,
                );
              }).toList(),
            ),
            buildTextField('CR Number', grNumberController),
            buildTextField('Van Number', vanNumberController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  widget.onAddStudent(nameController.text);
                  Navigator.pop(context, nameController.text);
                }
              },
              child: Text('Add Pick/Drop Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
