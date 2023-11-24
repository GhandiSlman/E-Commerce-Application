import 'package:eco/core/const/database_constanse.dart';
import 'package:eco/model/cart_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:path/path.dart';
//import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CardDateBaseHelper {
  CardDateBaseHelper._();

  static final CardDateBaseHelper db = CardDateBaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

 initDb() async {
  String path = join(await getDatabasesPath(), 'Carttt.db');

  return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCartProduct(
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnId TEXT NOT NULL
      );
    ''');
    await db.execute('''
      CREATE TABLE $tableCartProductFavorite(
        $columnNameF TEXT NOT NULL,
        $columnImageF TEXT NOT NULL,
        $columnPriceF TEXT NOT NULL,
        $columnQuantityF INTEGER NOT NULL,
        $columnIdF TEXT NOT NULL
      );
    ''');
  });
}


  Future<List<CartModel>> getAllFavorite() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProductFavorite);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insertFavorite(CartModel model) async {
    var dbClient = await database;
    await dbClient?.insert(tableCartProductFavorite, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteFavorite(String id) async {
    var dbClient = await database;
    return await dbClient!
        .delete(tableCartProductFavorite, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<CartModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartModel model) async {
    var dbClient = await database;
    await dbClient?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
  }

  deleteProduct(String id) async {
    var dbClient = await database;
    return await dbClient!
        .delete(tableCartProduct, where: 'id = ?', whereArgs: [id]);
  }
   Future<void> clearCart() async {
    var dbClient = await database;
    await dbClient!.delete(tableCartProduct);
  }
}
