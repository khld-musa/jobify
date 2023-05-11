import 'package:flutter/material.dart';
import 'package:jobify/screens/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   scaffoldBackgroundColor: Colors.grey[50],
        primarySwatch: Colors.blueGrey,
      ),
      home: const LoginPage(),
    );
  }
}
