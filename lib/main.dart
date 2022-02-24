// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hava_durumu_projesi/screens/loading_screen.dart';
import 'package:hava_durumu_projesi/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
