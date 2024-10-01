import 'package:flutter/material.dart';

import 'driver_login.dart'; // Assuming DriverLoginScreen is defined
import 'driver_student_list.dart';
import 'notification_screen.dart'; // Assuming NotificationScreen is the same as before

class DriverHomeScreen extends StatelessWidget {
  // Example list of notifications for the driver
  final List<String> notifications = [
    'New student assigned',
    'Route updated',
    'Emergency alert',
  ];

  void _confirmExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Do you really want to logout the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Navigate to Driver Login Screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DriverLoginScreen()),
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Home'),
        backgroundColor: Color(0xFF0C2544),
        actions: [
          // Notification icon button
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notification Screen with the driver's notifications
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(
                    notifications: notifications,
                    alerts: [],
                  ),
                ),
              );
            },
          ),
          // Logout icon button
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              _confirmExit(context); // Call the logout confirmation
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverStudentListScreen(
                      students: [], // Empty list of students (replace with real data)
                    ),
                  ),
                );
              },
              child: Text('View Students'),
            ),
            SizedBox(height: 20), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to School Bus Tracker (MainHomeScreen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DriverHomeScreen()), // Assuming this is your School Bus Tracker screen
                );
              },
              child: Text('School Bus Tracker'),
            ),
          ],
        ),
      ),
    );
  }
}
