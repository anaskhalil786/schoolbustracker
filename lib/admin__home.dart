import 'package:flutter/material.dart';
import 'package:schoolbustracker/admin_auth.dart';
import 'package:schoolbustracker/driver_list_screen.dart';
import 'package:schoolbustracker/view_bus_location.dart';

import 'add_driver_screen.dart';
import 'driver_student_list.dart';
import 'models/driver.dart';
import 'notification_screen.dart';
import 'parent_detail.dart';
import 'register_parent.dart';
import 'student_registration.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<String> students = [];
  List<Driver> drivers = [
    Driver(
      name: 'Yasir',
      email: 'yasir@example.com',
      mobileNumber: '03333321043',
      vanNumber: '100',
      licenseNumber: 'DI-1234',
    ),
    Driver(
      name: 'Imran',
      email: 'imran@example.com',
      mobileNumber: '03333321046',
      vanNumber: '13',
      licenseNumber: 'DT-123',
    ),
  ];
  List<String> notifications = [
    'New student added',
    'Driver Yasir updated route',
    'Parent meeting scheduled',
    'No Emergency Alerts',
  ];
  get selectedDriver => null;

  void _navigateToAddStudent() async {
    final newStudent = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentRegistrationScreen(
          onAddStudent: (student) {
            setState(() {
              students.add(student);
            });
          },
        ),
      ),
    );

    if (newStudent != null) {
      setState(() {
        students.add(newStudent);
      });

      _showSuccessDialog();
    }
  }

  void _navigateToAddDriver() async {
    final newDriver = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddDriverScreen(
          onAddDriver: (driver) {
            setState(() {
              drivers.add(driver);
            });
          },
        ),
      ),
    );

    if (newDriver != null) {
      setState(() {
        drivers.add(newDriver);
      });

      _showSuccessDialog();
    }
  }

  void _navigateToViewStudents() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverStudentListScreen(
          students: students,
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Action completed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Do you really want to logout the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss dialog
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AdminLoginScreen()),
              ); // Navigate back to login screen
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
        backgroundColor: Color(0xFF0C2544),
        title: Text('School Bus Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the NotificationScreen
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
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: _confirmExit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            buildGridTile(
              context,
              'assets/student.jpeg',
              'ADD STUDENT',
              _navigateToAddStudent,
            ),
            buildGridTile(
              context,
              'assets/detail.png',
              'View Student Details',
              _navigateToViewStudents,
            ),
            buildGridTile(
              context,
              'assets/driver.jpg',
              'View Bus Location',
              _navigateToAddDriver,
            ),
            buildGridTile(context, 'assets/detail.png', 'View Driver Details',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriverListScreen(),
                ),
              );
            }),
            buildGridTile(
              context,
              'assets/parent.png',
              'ADD PARENT',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterParentScreen(),
                  ),
                );
              },
            ),
            buildGridTile(
              context,
              'assets/detail.png',
              'View Parent Details',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentDetailsScreen(),
                  ),
                );
                // Handle view parent details action
              },
            ),
            buildGridTile(
              context,
              'assets/bus.jpg',
              'View Bus Location',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusTrackingScreen(),
                  ),
                );
                // Handle view parent details action
              },
            ),
            buildGridTile(
              context,
              'assets/locationlogo.png',
              'Driver Site Location',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusTrackingScreen(),
                  ),
                );
                // Handle view parent details action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridTile(BuildContext context, String imagePath, String title,
      VoidCallback onTap) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath, // Add your image asset here
                    height: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
