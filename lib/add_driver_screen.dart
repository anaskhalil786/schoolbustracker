import 'package:flutter/material.dart';

import 'models/driver.dart';

class AddDriverScreen extends StatefulWidget {
  final void Function(Driver) onAddDriver;

  AddDriverScreen({required this.onAddDriver});

  @override
  _AddDriverScreenState createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController vanNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Registration'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildTextField('Name', nameController),
            buildTextField('Email', emailController),
            buildTextField('Mobile Number', mobileNumberController),
            buildTextField('License Number', licenseNumberController),
            buildTextField('Van Number', vanNumberController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  final newDriver = Driver(
                    name: nameController.text,
                    email: emailController.text,
                    mobileNumber: mobileNumberController.text,
                    licenseNumber: licenseNumberController.text,
                    vanNumber: vanNumberController.text,
                  );
                  widget.onAddDriver(newDriver);
                  Navigator.pop(context, newDriver);
                }
              },
              child: Text('Add Driver'),
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
