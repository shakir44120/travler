import 'package:flutter/material.dart';
import 'package:travler/initial%20screens/splash%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'TRAVLER',
      debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}