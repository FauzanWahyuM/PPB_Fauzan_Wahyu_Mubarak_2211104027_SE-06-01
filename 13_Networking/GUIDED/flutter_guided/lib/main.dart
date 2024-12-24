import 'package:flutter/material.dart';
import 'package:flutter_guided/view/detail_page.dart';
import 'package:flutter_guided/view/my_homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(
              name: '/',
              page: () => MyHomepage(
                    title: 'Praktikum 13',
                  )),
          GetPage(
              name: '/detail',
              page: () => MyDetailPage(
                    title: 'Praktikum 13',
                  )),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
