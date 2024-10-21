import 'package:flutter/material.dart';
import 'package:flutter_pertemuan_4/custom_scroll_view.dart';
import 'package:flutter_pertemuan_4/flex.dart';
import 'package:flutter_pertemuan_4/list_builder.dart';
import 'package:flutter_pertemuan_4/list_separated.dart';

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
      home: const LatihanCustomScroll(title: "Pertemuan 5"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
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
                color: Colors.blue[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2021/10/28/4jpg-20211028031134.jpg"),
                      const Text("Padang Pasir")
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info),
                      SizedBox(
                        height: 40,
                      ),
                      const Text("Item 3")
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phishing),
                      SizedBox(
                        height: 40,
                      ),
                      const Text("Item 4")
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.purple[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.people),
                      SizedBox(
                        height: 40,
                      ),
                      const Text("Item 5")
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.pink[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.hail_sharp),
                      SizedBox(
                        height: 40,
                      ),
                      const Text("Item 6")
                    ],
                  ),
                ),
              ),
            ]));
  }
}
