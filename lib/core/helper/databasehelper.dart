// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopex/core/models/cartproduct.dart';
import 'package:sqflite/sqflite.dart';

const String tablename = "cartproduct";
const String Column_id = "id";
const String Column_Product = 'ProductName';
const String Column_Imageurl = 'Imageurl';
const String Column_Item = 'item';
const String Column_size = "size";
const String Column_Price = 'Price';
const String Column_amount = 'totalamount';

class DataBaseService {
  //singleton class

  DataBaseService._();
  static final DataBaseService data = DataBaseService._();
  Database? _database;
  //this helps to get back the _databaserservice which is d same as Database.internal

//check if db is null
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    // this helps to put ur database in ur directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'cartproduct.db');
    var database = openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }

//this will create the table.
  Future<void> _onCreate(Database database, int version) async {
    await database.execute(
      """
      CREATE TABLE $tablename(
      $Column_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $Column_Imageurl TEXT,
      $Column_Item INTEGER,
      $Column_Price TEXT,
      $Column_Product TEXT,
      $Column_size TEXT,
      $Column_amount INTEGER)
     """,
    );
  }

//create
  Future<void> insert(CartProduct cartProduct) async {
    var db = await database;
    await db!.insert(tablename, cartProduct.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//read
  Future<List<CartProduct>> read() async {
    var db = await database;
    var file = await db!.query(tablename, columns: [
      Column_id,
      Column_Imageurl,
      Column_Item,
      Column_Price,
      Column_Product,
      Column_size,
      Column_amount
    ]);
    List<CartProduct> carted = [];
    // ignore: avoid_function_literals_in_foreach_calls
    file.forEach((element) {
      CartProduct carts = CartProduct.fromMap(element);
      carted.add(carts);
    });
    return carted;
  }

//delect
  Future<int> remove(int? id) async {
    var client = await database;
    return client!.delete(tablename, where: '$Column_id = ?', whereArgs: [id]);
  }

//update
  Future<int> update(CartProduct cartProduct) async {
    var data = await database;
    return data!.update(tablename, cartProduct.toMap(),
        where: '$Column_id = ?', whereArgs: [cartProduct.id]);
  }
}
