import 'package:flutter/material.dart';
import 'package:flutter_guided/dropdown.dart';
import 'package:flutter_guided/my_battombar.dart';
import 'package:flutter_guided/my_package.dart';
import 'package:flutter_guided/my_tabbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: const LatihanDropdown(),
    ));
  }
}
