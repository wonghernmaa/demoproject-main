import 'package:flutter/material.dart';
import 'package:demoproject/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // เปิดแอปที่หน้า HomePage
    );
  }
}
