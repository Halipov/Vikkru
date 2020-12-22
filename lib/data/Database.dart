import 'package:flutter/services.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:sqflite_sqlcipher/sql.dart';
import 'package:sqflite_sqlcipher/sqlite_api.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'User.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "my_db.db");
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "my_db.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    var db = await openDatabase(path, password: "dazdesparol", readOnly: false);
    db.execute('PRAGMA foreign_keys=ON');
    return db;
  }

  newValue(String column, String value) async {
    final db = await database;
    var res = await db.rawInsert("INSERT Into Form ($column)"
        " VALUES ($value)");
    return res;
  }

  getValue(String column) async {
    final db = await database;
    var res = await db.query("$column");
    return res.isNotEmpty ? res.first : Null;
  }

  updateValue(String column, String value) async {
    final Map<String, dynamic> map = {value: value};
    final db = await database;
    var res = await db.update("$column", map);
    return res;
  }

  Future<User> addUser(User user) async {
    final Database db = await database;
    try {
      user.userId = await db.insert(tableUsers, user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (err) {
      print(err);
    }
    return user;
  }

  Future<List<User>> getUsers() async {
    final Database db = await database;

    List<User> res = [];
    try {
      final List<Map<String, dynamic>> maps = await db.query(tableUsers);
      res = List.generate(maps.length, (i) => User.fromMap(maps[i]));
      print(res);
    } catch (err) {
      print(err);
    }
    return res;
  }

  Future<User> getUser(int id) async {
    final Database db = await database;

    try {
      List<Map> maps = await db.query(tableUsers,
          columns: [colUsersID, colUsersLogin, colUsersPassword],
          where: '${colUsersID} = ?',
          whereArgs: [id]);
      if (maps.length > 0) {
        return User.fromMap(maps.first);
      }
    } catch (err) {
      print(err);
    }
    return null;
  }
}
