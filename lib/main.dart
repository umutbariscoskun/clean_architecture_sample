import 'package:clean_architecture_01/src/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
