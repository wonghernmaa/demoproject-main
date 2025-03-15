import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  const ProfilePage(
      {super.key, this.name = "ไม่มีชื่อ", this.email = "ไม่มีอีเมล"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("โปรไฟล์ของคุณ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ชื่อ: $name", style: const TextStyle(fontSize: 20)),
            Text("อีเมล: $email", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // กลับไปหน้าก่อนหน้า
              },
              child: const Text("กลับไปหน้าแรก"),
            ),
          ],
        ),
      ),
    );
  }
}
