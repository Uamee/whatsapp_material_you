import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  //const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        elevation: 4,
      ),
      body: const Hero(
          tag: 'image1', child: Image(image: AssetImage('assets/george.jpg'))),
    );
  }
}
