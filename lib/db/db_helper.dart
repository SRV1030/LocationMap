import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT)'); //Creating a new sql table user_places.
    }, version: 1); //opens database or creates new db
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final sqldb = await DBHelper.database();
    await sqldb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final sqldb = await DBHelper.database();
    return sqldb.query(table);
  }
}
