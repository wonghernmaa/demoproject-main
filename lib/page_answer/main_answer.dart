import 'package:flutter/material.dart';
import 'package:demoproject/page_answer/answer1.dart';
import 'package:demoproject/page_answer/answer2.dart';
import 'package:demoproject/page_answer/answer3.dart';
import 'package:demoproject/page_answer/answer4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OptionAnswerPage(),
    );
  }
}

class OptionAnswerPage extends StatelessWidget {
  const OptionAnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My answer'),
        backgroundColor: const Color.fromARGB(255, 227, 70, 61),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GridLayoutExample()),
                );
              },
              child: const Text('Answer1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SocialMediaPost()),
                );
              },
              child: const Text('Answer2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductLayout()),
                );
              },
              child: const Text('Answer3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text('Answer4'),
            ),
          ],
        ),
      ),
    );
  }
}
