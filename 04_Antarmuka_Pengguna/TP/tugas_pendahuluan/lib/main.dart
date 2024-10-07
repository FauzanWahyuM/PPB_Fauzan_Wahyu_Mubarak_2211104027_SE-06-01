import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rekomendasi Wisata',
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  "Rekomendasi Wisata",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.purple,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Text("Baturraden"),
                    Image.asset('assets/image.jpeg'),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Baturaden adalah surga bagi pencinta alam di Jawa Tengah. Dengan udara sejuk, pemandangan hijau yang menyegarkan, dan beragam air terjun yang memukau, Baturaden menawarkan pengalaman liburan yang tak terlupakan.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text("Kunjungi Tempat"),
                      onPressed: () {},
                    )
                  ])),
            )));
  }
}
