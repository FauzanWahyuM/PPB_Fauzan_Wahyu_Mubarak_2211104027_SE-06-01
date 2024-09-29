import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue[700]!,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Biodata Diri'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Kotak 1: Nama
              _buildInfoBox('Nama', 'Fauzan Wahyu Mubarak',
                  Colors.lightBlue[700]!, Colors.white, Icons.person),
              SizedBox(height: 10),

              // Kotak 2: Email
              _buildInfoBox('Email', 'Fauzan@example.com',
                  Colors.lightBlue[700]!, Colors.white, Icons.email),
              SizedBox(height: 10),

              // Kotak 3: Nomor Telepon
              _buildInfoBox('Nomor Telepon', '081234567890',
                  Colors.lightBlue[700]!, Colors.white, Icons.phone),
              SizedBox(height: 10),

              // Kotak 4: Alamat
              _buildInfoBox('Alamat', 'Jl. Merpati No. 13, Kota Purwokerto',
                  Colors.lightBlue[700]!, Colors.white, Icons.location_on),
              SizedBox(height: 10),

              // Kotak 5: Deskripsi Diri
              _buildInfoBox(
                  'Tentang Saya',
                  'Saya seorang Mahasiswa Telkom University Purwokerto.',
                  Colors.lightBlue[700]!,
                  Colors.white,
                  Icons.info),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String content, Color backgroundColor,
      Color textColor, IconData icon) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: textColor, size: 30),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
