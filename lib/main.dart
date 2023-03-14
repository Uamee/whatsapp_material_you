import 'package:flutter/material.dart';
import 'package:whatsapp_material_you/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
        splashColor: Colors.transparent,
      ),
      home: const HomeScreen(),
    );
  }
}
