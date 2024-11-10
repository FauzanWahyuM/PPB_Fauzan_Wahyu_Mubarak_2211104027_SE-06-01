import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Latihan Memilih Gambar'),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                dashPattern: [6, 3],
                color: Colors.black,
                strokeWidth: 2,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber[100],
                  child: const Icon(
                    Icons.image_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        backgroundColor: Colors.amber),
                    child: Row(
                      children: [
                        Icon(Icons.camera, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Camera',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        backgroundColor: Colors.amber),
                    child: Row(
                      children: [
                        Icon(Icons.photo_library, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Gallery',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(200, 48),
                ),
                child: Text(
                  'Hapus Gambar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
