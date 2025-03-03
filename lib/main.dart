import 'package:flutter/material.dart';

void main() {
  runApp(TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrafficLightScreen(),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  @override
  _TrafficLightScreenState createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentLight = 0;

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3;
    });
  }

  double _getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 5,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTrafficLightIcon(Colors.red, 0),
            SizedBox(width: 5),
            _buildTrafficLightIcon(Colors.yellow, 1),
            SizedBox(width: 5),
            _buildTrafficLightIcon(Colors.green, 2),
            SizedBox(width: 10),
            Text(
              'Traffic Light',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf8f9fa), 
              Color(0xFFdee2e6), 
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // กรอบไฟจราจร
              Container(
                width: 120,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAnimatedLight(0, Colors.red),
                    _buildAnimatedLight(1, Colors.yellow),
                    _buildAnimatedLight(2, Colors.green),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // ปุ่มเปลี่ยนไฟ
              ElevatedButton(
                onPressed: _changeLight,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 10,
                ),
                child: Text(
                  'Change Light',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrafficLightIcon(Color color, int index) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _getOpacity(index),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedLight(int index, Color color) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _getOpacity(index),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 30,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
