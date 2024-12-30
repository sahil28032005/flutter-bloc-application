import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'expenses.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, amount REAL, date TEXT)');
    });
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return db.insert(table, data);
  }

  //for query of the database
  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return db.query(table);
  }

  //for delete particular recoed form table
  Future<int> delete(String table, int id) async {
    final db = await database;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
