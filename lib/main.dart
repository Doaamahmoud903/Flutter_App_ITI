import 'package:first_app_filter/bmi_home.dart';
import 'package:first_app_filter/bmi_view.dart';
import 'package:flutter/material.dart';
import 'package:first_app_filter/messanger_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: BmiHomePage(),
    );
  }
}

