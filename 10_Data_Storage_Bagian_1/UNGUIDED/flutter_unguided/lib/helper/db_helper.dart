import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/mahasiswa.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'mahasiswa.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE mahasiswa(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nama TEXT,
              nim TEXT,
              alamat TEXT,
              hobi TEXT
            )''',
        );
      },
      version: 1,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Insert Mahasiswa
  Future<int> insertMahasiswa(Mahasiswa mahasiswa) async {
    final db = await database;
    return db.insert('mahasiswa', mahasiswa.toMap());
  }

  // Get All Mahasiswa
  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mahasiswa');
    return maps.map((map) => Mahasiswa.fromMap(map)).toList();
  }

  // Update Mahasiswa
  Future<int> updateMahasiswa(Mahasiswa mahasiswa) async {
    final db = await database;
    return db.update(
      'mahasiswa',
      mahasiswa.toMap(),
      where: 'id = ?',
      whereArgs: [mahasiswa.id], // Update berdasarkan ID
    );
  }

  // Delete Mahasiswa
  Future<int> deleteMahasiswa(int id) async {
    final db = await database;
    return db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id], // Hapus berdasarkan ID
    );
  }
}
