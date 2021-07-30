import 'dart:async';
import 'dart:developer';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static FutureOr<sql.Database> initDataBase() async {
    final dbPath = await sql.getDatabasesPath();
    log('Local DataBase Created', name: 'DBHelper');
    return sql.openDatabase(
      path.join(dbPath, 'reading_list.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE post_ids(post_id TEXT PRIMARY KEY)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await initDataBase();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    log('The following data has been inserted to the local database: $data',
        name: 'DBHelper.insert');
  }

  static Future<void> delete(String table, String toBeDeleted) async {
    final db = await initDataBase();
    db.delete(table, where: toBeDeleted);
    log('The following data has been deleted from the local database: $toBeDeleted',
        name: 'DBHelper.delete');
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await initDataBase();
    return db.query(table);
  }
}
