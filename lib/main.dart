import 'package:flutter/material.dart';
import 'pages/home/home.dart';

void main() {
  runApp(Myapp());
}

// สร้าง widget
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      

      );
  }
}
