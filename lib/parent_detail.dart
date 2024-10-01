import 'package:flutter/material.dart';

class ParentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of parents assigned to the driver
    final List<String> parents = [
      'Zayan',
      'Fozia',
      'Sara',
      'Aslam',
      'Khanzada'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Parents'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: parents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              parents[index],
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
