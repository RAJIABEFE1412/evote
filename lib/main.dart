import 'package:evote/pages/dashboard/home.dart';
import 'package:evote/pages/dashboard/last_screen.dart';
import 'package:evote/pages/vote/Vote_detail.dart';
import 'package:evote/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
