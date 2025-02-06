import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const AQIApp());
}

class AQIApp extends StatelessWidget {
  const AQIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: AQIScreen(),
    );
  }
}

class AQIScreen extends StatefulWidget {
  @override
  _AQIScreenState createState() => _AQIScreenState();
}

class _AQIScreenState extends State<AQIScreen> {
  int? aqi;
  String status = "Loading...";
  double? temperature;
  final String apiUrl =
      "https://api.waqi.info/feed/here/?token=f68a9dfffe100d704550a70f5f35775ac64ea72d";

  @override
  void initState() {
    super.initState();
    fetchAQI();
  }

  Future<void> fetchAQI() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          aqi = data['data']['aqi'];
          temperature = data['data']['iaqi']['t']['v'].toDouble();
          status = getAQIStatus(aqi!);
        });
      } else {
        setState(() {
          status = "Error fetching data";
        });
      }
    } catch (e) {
      setState(() {
        status = "Error fetching data";
      });
    }
  }

  String getAQIStatus(int aqi) {
    if (aqi <= 50) return "Good";
    if (aqi <= 100) return "Moderate";
    if (aqi <= 150) return "Unhealthy for Sensitive Groups";
    if (aqi <= 200) return "Unhealthy";
    if (aqi <= 300) return "Very Unhealthy";
    return "Hazardous";
  }

  Color getAQIColor(int? aqi) {
    if (aqi == null) return Colors.grey;
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Air Quality Index (AQI)",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: getAQIColor(aqi),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud, size: 80, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                "Bangkok",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: getAQIColor(aqi),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      aqi != null ? "$aqi" : "Loading...",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                temperature != null
                    ? "Temperature: ${temperature!.toStringAsFixed(1)}°C"
                    : "Loading temperature...",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: fetchAQI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                ),
                child: const Text(
                  "Refresh",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
