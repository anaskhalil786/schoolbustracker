import 'package:flutter/material.dart';

import 'osrm_service.dart'; // Import the file where your getETA function is located

class BusTrackingScreen extends StatefulWidget {
  @override
  _BusTrackingScreenState createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  String estimatedTime = "Calculating...";

  @override
  void initState() {
    super.initState();
    // Example coordinates (replace these with real-time GPS data)
    double busLat = 52.5200; // Bus location latitude
    double busLon = 13.4050; // Bus location longitude
    double studentLat = 52.5300; // Student stop latitude
    double studentLon = 13.4100; // Student stop longitude

    // Call OSRM to get the ETA
    getETA(busLat, busLon, studentLat, studentLon).then((eta) {
      setState(() {
        estimatedTime = eta;
      });
    }).catchError((error) {
      setState(() {
        estimatedTime = 'Error calculating ETA';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Estimated Time to Stop:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              estimatedTime,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
