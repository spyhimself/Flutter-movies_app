import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;
  Future<Database?> get db async {
    if(_db == null) {
      _db = await intialisation();
      return _db;
    } else return _db;
  }


  // --------------------------------------------
  Future<Database> intialisation() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path, "Cine");
    Database my_db = await openDatabase(path, onCreate: _createDb, version: 1);

    return my_db;
  }
  // --------------------------------------------
  _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "movies" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "duration" TEXT NOT NULL
    )
    ''');
    print("============DB CREATED SUCCESSFULLY============");
  }
  // ----------------------CRUD-------------------
  // CREATE
  Future<int> insertData(String sql) async {
    Database? mydb = await db;

    int rep = await mydb!.rawInsert(sql);
    return rep;
  }
  // READ
  Future<List<Map>> getData(String sql) async {
    Database? mydb = await db;

    List<Map> rep = await mydb!.rawQuery(sql);
    return rep;
  }
  // UPDATE
  Future<int> updateData(String sql) async {
    Database? mydb = await db;

    int rep = await mydb!.rawUpdate(sql);
    return rep;
  }
  // DELETE
  Future<int> deleteData(String sql) async {
    Database? mydb = await db;

    int rep = await mydb!.rawDelete(sql);
    return rep;
  }

}