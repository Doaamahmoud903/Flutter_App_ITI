import 'package:first_app_filter/bmi_home.dart';
import 'package:first_app_filter/bmi_view.dart';
import 'package:first_app_filter/login_screen.dart';
import 'package:first_app_filter/products_screen.dart';
import 'package:first_app_filter/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ProductsScreen(),

    );
  }
}
