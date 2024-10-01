import 'package:flutter/material.dart';

import 'parent_home.dart'; // Import your Alert class

class NotificationScreen extends StatelessWidget {
  final List<Alert> alerts;

  NotificationScreen(
      {required this.alerts, required List<String> notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return ListTile(
            title: Text(alert.message),
            subtitle: Text(
              '${alert.timestamp.toLocal()} - ${alert.type}',
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
