import 'package:flutter/material.dart';

import 'notification_screen.dart'; // Assuming this is where NotificationScreen is defined
import 'parent_login.dart'; // Assuming this is your login screen

class Alert {
  final String type;
  final String message;
  final DateTime timestamp;

  Alert({required this.type, required this.message, required this.timestamp});
}

class ParentHomeScreen extends StatelessWidget {
  // Simulated data for driver alerts
  final List<Alert> driverAlerts = [
    Alert(
      type: 'Pickup/Drop',
      message:
          'aslam was DROPPED at 1174 E 59th Pl, Los Angeles, CA 90001, USA',
      timestamp: DateTime.parse('2018-12-20 21:57:12'),
    ),
    Alert(
      type: 'Pickup/Drop',
      message: 'fozia was PICKED at 1174 E 59th Pl, Los Angeles, CA 90001, USA',
      timestamp: DateTime.parse('2018-12-24 00:23:47'),
    ),
    Alert(
      type: 'Emergency',
      message:
          'fozia had an Emergency at 1174 E 59th Pl, Los Angeles, CA 90001, USA',
      timestamp: DateTime.parse('2018-12-22 14:19:57'),
    ),
    Alert(
      type: 'Emergency',
      message:
          'aslam had an Emergency at 1174 E 59th Pl, Los Angeles, CA 90001, USA',
      timestamp: DateTime.parse('2018-12-22 14:19:57'),
    ),
  ];

  // Function to confirm exit and navigate to login screen
  void _confirmExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Do you really want to logout the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss dialog
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ParentLoginScreen()),
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
        title: Text('Parent Home'),
        backgroundColor: Color(0xFF0C2544),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the NotificationScreen with driver alerts
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(
                    alerts: driverAlerts,
                    notifications: [],
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              _confirmExit(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: driverAlerts.length,
        itemBuilder: (context, index) {
          final alert = driverAlerts[index];
          return ListTile(
            title: Text(alert.message),
            subtitle: Text(
              '${alert.timestamp.toLocal()}',
              style: TextStyle(color: Colors.grey),
            ),
            isThreeLine: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ParentHomeScreen(),
  ));
}
