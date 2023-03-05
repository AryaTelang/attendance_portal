import 'package:attendance_portal/home.dart';
import 'package:attendance_portal/login.dart';
import 'package:flutter/material.dart';

import 'log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Log(),debugShowCheckedModeBanner: false,
    );
  }
}



