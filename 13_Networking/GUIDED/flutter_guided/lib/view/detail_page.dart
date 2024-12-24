import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDetailPage extends StatelessWidget {
  const MyDetailPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Praktikum 13'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Hello World'),
            ),
            ElevatedButton(onPressed: () => Get.back(), child: Text('Kembali'))
          ],
        ),
      ),
    );
  }
}
