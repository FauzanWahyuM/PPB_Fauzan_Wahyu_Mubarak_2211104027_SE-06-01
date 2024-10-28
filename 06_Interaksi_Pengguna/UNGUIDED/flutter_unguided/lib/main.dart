import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BerandaPage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Pertemuan 6'),
        backgroundColor: Colors.amber,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Beranda',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color putih
                borderRadius: BorderRadius.circular(10), // Border radius
                border: Border.all(color: Colors.blue), // Border biru
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama',
                  border: InputBorder.none, // Menghilangkan border default
                  contentPadding:
                      EdgeInsets.all(10), // Padding di dalam TextFormField
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color putih
                borderRadius: BorderRadius.circular(10), // Border radius
                border: Border.all(color: Colors.blue), // Border biru
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Email',
                  border: InputBorder.none, // Menghilangkan border default
                  contentPadding:
                      EdgeInsets.all(10), // Padding di dalam TextFormField
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Warna tombol submit menjadi oranye
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data berhasil disimpan')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Search',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color putih
                borderRadius: BorderRadius.circular(10), // Border radius
                border: Border.all(color: Colors.blue), // Border biru
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan kata kunci',
                  border: InputBorder.none, // Menghilangkan border default
                  contentPadding:
                      EdgeInsets.all(10), // Padding di dalam TextFormField
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Warna tombol search menjadi oranye
              ),
              onPressed: () {
                // Process search here
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color putih
                  borderRadius: BorderRadius.circular(10), // Border radius
                  border: Border.all(color: Colors.blue), // Border biru
                ),
                child: Text('Nama: Fauzan'),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color putih
                  borderRadius: BorderRadius.circular(10), // Border radius
                  border: Border.all(color: Colors.blue), // Border biru
                ),
                child: Text('Email: Fauzan@gmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
