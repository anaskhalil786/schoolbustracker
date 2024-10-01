import 'package:flutter/material.dart';

import 'add_driver_screen.dart';
import 'models/driver.dart';

class DriverListScreen extends StatefulWidget {
  @override
  _DriverListScreen createState() => _DriverListScreen();
}

class _DriverListScreen extends State<DriverListScreen> {
  List<Driver> drivers = []; // Initial list

  void addDriver(Driver newDriver) {
    setState(() {
      drivers.add(newDriver);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver List'),
        backgroundColor: Color(0xFF0C2544),
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return ListTile(
            title: Text(driver.name),
            subtitle: Text('Email: ${driver.email}'),
            // You can display other driver details here
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddDriverScreen and wait for result
          final newDriver = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDriverScreen(onAddDriver: addDriver),
            ),
          );

          // Check if a new driver was returned and if it's valid
          if (newDriver != null && newDriver is Driver) {
            addDriver(newDriver);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
