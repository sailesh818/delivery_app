import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:food_delivery_app/homescreen/model/foods_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'foods.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE foods (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            image TEXT,
            cuisines TEXT,
            price INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertFood(FoodsModel food) async {
    final dbClient = await db;
    await dbClient.insert(
      'foods',
      food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> clearFoods() async {
    final dbClient = await db;
    await dbClient.delete('foods');
  }

  Future<List<FoodsModel>> getFoods() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('foods');

    return List.generate(maps.length, (i) {
      return FoodsModel(
        name: maps[i]['name'],
        image: maps[i]['image'],
        cuisines: maps[i]['cuisines'],
        price: maps[i]['price'],
      );
    });
  }
}
