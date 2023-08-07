import 'package:new_bumi_baik/screens/auth/login.dart';
// import 'package:new_bumi_baik/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:new_bumi_baik/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BumiBaik',
      home: Splashscreen(),
    );
  }
}
