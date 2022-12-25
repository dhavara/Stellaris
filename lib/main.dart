import 'package:dietaryminder/views/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Stellaris',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFEFFDE),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage());
  }
}
