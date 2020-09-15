import 'dart:io';

import 'package:flora/models/flower.dart';
import 'package:flora/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.make();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper.make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DBNAME);
    var myDb =
        openDatabase(path, version: Constants.DB_VERSION, onCreate: _onCreate);

    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${Constants.TABLE_NAME} (${Constants.COLUMN_ID} INTEGER PRIMARY KEY, "
        "${Constants.COLUMN_NAME} TEXT, ${Constants.COLUMN_SHORT_DESC} TEXT,"
        "${Constants.COLUMN_DESCRIPTION} TEXT, ${Constants.COLUMN_IMAGE} TEXT,"
        "${Constants.COLUMN_COLOR_NAME} INTEGER, ${Constants.COLUMN_COLOR_DESCRIPTION} INTEGER,"
        "${Constants.COLUMN_COLOR_MAIN} INTEGER, ${Constants.COLUMN_COLOR_LIGHT} INTEGER,"
        "${Constants.COLUMN_REVEAL_DATE} TEXT, ${Constants.COLUMN_SEEN} INTEGER );");
  }

  Future<int> insertFlower(Flower flower) async {
    var dbClient = await db;
    int count = await dbClient.insert(Constants.TABLE_NAME, flower.toMap());

    return count;
  }

  Future<List<Flower>> getAllFlowers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} ORDER BY ${Constants.COLUMN_REVEAL_DATE}");

    return [for (var flower in result.toList()) Flower.fromMap(flower)];
  }

  Future<List<Flower>> getAllVisibleFlowers() async {
    var dbClient = await db;
    var now = DateTime.now().toIso8601String();
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_REVEAL_DATE} < '${now}' ORDER BY ${Constants.COLUMN_REVEAL_DATE}");

    return [for (var flower in result.toList()) Flower.fromMap(flower)];
  }

  Future<int> getCount() async {
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${Constants.TABLE_NAME}"));
    return count;
  }

  Future<Flower> getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_ID} = $id");
    if (result == null) return null;
    return new Flower.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(Constants.TABLE_NAME,
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [id]);
    return count;
  }

  Future<int> updateItem(Flower flower) async {
    var dbClient = await db;
    int count = await dbClient.update(Constants.TABLE_NAME, flower.toMap(),
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [flower.id]);

    return count;
  }
}
