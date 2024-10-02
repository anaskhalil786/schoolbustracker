import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getETA(double originLat, double originLon, double destLat, double destLon) async {
  final osrmUrl =
      'http://router.project-osrm.org/route/v1/driving/$originLon,$originLat;$destLon,$destLat?overview=false';

  final response = await http.get(Uri.parse(osrmUrl));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final duration = data['routes'][0]['duration']; // in seconds
    final etaMinutes = (duration / 60).round();
    return '$etaMinutes min';
  } else {
    throw Exception('Failed to load ETA');
  }
}
