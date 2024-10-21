import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LatihanFlex(title: 'Pertemuan 5'),
    );
  }
}

class LatihanFlex extends StatefulWidget {
  const LatihanFlex({super.key, required this.title});

  final String title;

  @override
  State<LatihanFlex> createState() => _LatihanFlexState();
}

class _LatihanFlexState extends State<LatihanFlex> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
//Flexible
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Text(
                    "Flexible takes up the remaining space but can shrink if needed.",
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          SizedBox(height: 20),

          //Expanded
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: const Text(
                    "Expanded forces the widget to take up all the remaining space.",
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
        ],
      ),
    );
  }
}
