import '../db/db_helper.dart';
import '../models/user_model.dart';

class UserRepository {
  // Tambah data
  static Future<int> insertUser(User user) async {
    final db = await DBHelper.db();
    return await db.insert('users', user.toMap());
  }

  // Ambil semua data
  static Future<List<User>> getUsers() async {
    final db = await DBHelper.db();
    final result = await db.query('users', orderBy: 'id DESC');
    return result.map((map) => User.fromMap(map)).toList();
  }

  // Ambil data berdasarkan ID
  static Future<User?> getUserById(int id) async {
    final db = await DBHelper.db();
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  // Update data
  static Future<int> updateUser(User user) async {
    final db = await DBHelper.db();
    return await db
        .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  // Hapus data
  static Future<int> deleteUser(int id) async {
    final db = await DBHelper.db();
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
