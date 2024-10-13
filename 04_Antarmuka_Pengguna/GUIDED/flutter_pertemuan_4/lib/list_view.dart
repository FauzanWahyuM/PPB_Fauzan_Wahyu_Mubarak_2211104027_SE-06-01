import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LatihanList(title: 'Pertemuan 4'),
    );
  }
}

class LatihanList extends StatefulWidget {
  const LatihanList({super.key, required this.title});

  final String title;

  @override
  State<LatihanList> createState() => _LatihanListState();
}

class _LatihanListState extends State<LatihanList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "https://images.theconversation.com/files/521142/original/file-20230416-3675-x66bti.jpg"),
                  SizedBox(
                    height: 40,
                  ),
                  const Text("Lautan")
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "https://images.theconversation.com/files/521142/original/file-20230416-3675-x66bti.jpg"),
                  SizedBox(
                    height: 40,
                  ),
                  const Text("Lautan")
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "https://images.theconversation.com/files/521142/original/file-20230416-3675-x66bti.jpg"),
                  SizedBox(
                    height: 40,
                  ),
                  const Text("Lautan")
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "https://images.theconversation.com/files/521142/original/file-20230416-3675-x66bti.jpg"),
                  SizedBox(
                    height: 40,
                  ),
                  const Text("Lautan")
                ],
              ),
            ),
          ),
        ]));
  }
}
