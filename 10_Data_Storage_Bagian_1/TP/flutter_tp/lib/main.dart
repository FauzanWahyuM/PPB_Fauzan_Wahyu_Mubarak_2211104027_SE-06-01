import 'package:flutter/material.dart';
import 'repositories/user_repository.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = []; // Menyimpan daftar pengguna
  bool _isLoading = true; // Untuk menampilkan loader saat data dimuat

  @override
  void initState() {
    super.initState();
    _fetchUsers(); // Ambil data pengguna saat widget dimuat
  }

  // Fungsi untuk mengambil data pengguna dari database
  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    final users = await UserRepository.getUsers();

    setState(() {
      _users = users;
      _isLoading = false; // Selesai memuat data
    });
  }

  // Fungsi untuk menambahkan pengguna
  Future<void> _addUser() async {
    await UserRepository.insertUser(
      User(name: 'New User', email: 'new@example.com'),
    );
    _fetchUsers(); // Perbarui daftar pengguna setelah menambahkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _users.isEmpty
              ? Center(child: Text('No users found.'))
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing:
                          Text(user.createdAt?.toLocal().toString() ?? ''),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser, // Tambah pengguna baru
        child: Icon(Icons.add),
      ),
    );
  }
}
