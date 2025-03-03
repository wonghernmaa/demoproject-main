import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              position,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, size: 16, color: Colors.blue),
                const SizedBox(width: 6),
                Text(email),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.green),
                const SizedBox(width: 6),
                Text(phoneNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
