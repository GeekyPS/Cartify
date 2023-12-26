import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // whole app needs to be wrapped with material app , only one material app in entire app
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
