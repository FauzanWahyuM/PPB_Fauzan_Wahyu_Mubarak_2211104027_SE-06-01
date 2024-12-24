import 'package:flutter/material.dart';
import 'package:flutter_unguided/model/add_note.dart';
import 'package:get/get.dart';
import 'view/homepage.dart';
import 'model/note_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Catatan Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Homepage()),
        GetPage(name: '/add-note', page: () => const AddNotePage()),
      ],
    );
  }
}
