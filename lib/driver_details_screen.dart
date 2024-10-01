// lib/screens/driver_details_screen.dart

import 'package:flutter/material.dart';
import 'package:schoolbustracker/models/driver.dart';

class DriverDetailsScreen extends StatelessWidget {
  final Driver driver;

  DriverDetailsScreen({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(driver.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${driver.name}', style: TextStyle(fontSize: 20)),
            Text('Van Number: ${driver.vanNumber}',
                style: TextStyle(fontSize: 18)),
            Text('License Number: ${driver.licenseNumber}',
                style: TextStyle(fontSize: 18)),
            Text('Mobile Number: ${driver.mobileNumber}',
                style: TextStyle(fontSize: 18)),
            // Add more details if needed
          ],
        ),
      ),
    );
  }
}
