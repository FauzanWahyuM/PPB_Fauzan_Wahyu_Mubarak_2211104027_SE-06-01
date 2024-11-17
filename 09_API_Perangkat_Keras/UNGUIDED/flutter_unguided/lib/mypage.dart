import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Memilih Gambar',
      home: ImagePickerWidget(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  bool isPicking = false;

  Future<void> _pickImage(ImageSource source) async {
    if (isPicking) return;
    setState(() {
      isPicking = true;
    });

    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: source,
        imageQuality: 50,
      );

      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      setState(() {
        isPicking = false;
      });
    }
  }

  void _clearImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
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
                  onPressed: () => _pickImage(ImageSource.camera),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.amber,
                  ),
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
                  onPressed: () => _pickImage(ImageSource.gallery),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.amber,
                  ),
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
              onPressed: _clearImage,
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
    );
  }
}
