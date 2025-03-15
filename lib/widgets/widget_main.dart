import 'package:flutter/material.dart';
import 'package:demoproject/widgets/profile_card.dart'; // นำเข้าไฟล์ ProfileCard ถ้าแยกไฟล์ไว้

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Card')),
        body: Center(
          child: ProfileCard(
            name: 'Kisra Khongkaew',
            position: 'Flutter Developer',
            email: 'kisra@example.com',
            phoneNumber: '+66 1234 5678',
            imageUrl: 'https://via.placeholder.com/150',
          ),
        ),
      ),
    );
  }
}
