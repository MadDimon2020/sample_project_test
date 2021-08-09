import 'dart:developer';
import 'dart:async';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

//   static String newsSubscription = '''
// subscription newsFeedSubscription {
//   news(order_by: {created_at: desc}) {
//     author {
//      display_name
//      avatar_url
//     }
//     content
//     created_at
//     id
//     title
//   }
// }
// ''';

  static FutureOr<sql.Database> _initDataBase() async {
    final dbPath = await sql.getDatabasesPath();
    log('Initializing local database', name: 'HomeController');
    return sql.openDatabase(
      path.join(dbPath, 'reading_list.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE post_ids(post_id TEXT PRIMARY KEY)');
      },
      version: 1,
    );
  }

  static sql.Database _readingListDB;
  sql.Database get readingListDB => _readingListDB;

  static RxList<String> _readingList = RxList<String>();
  static RxList<String> get readingList => _readingList;

  static Future<void> insertToDatabase(Map<String, Object> data) async {
    await _readingListDB.insert('post_ids', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    log('The following data has been inserted to the local database: $data',
        name: 'HomeController');
  }

  static Future<void> deleteFromDatabase(String postId) async {
    await _readingListDB
        .delete('post_ids', where: 'post_id = ?', whereArgs: [postId]);
    log('The following data has been removed from the local database: $postId',
        name: 'HomeController');
  }

  static void insertToReadingList(String postId) {
    _readingList.add(postId);
  }

  static void deleteFromReadingList(String postId) {
    _readingList.removeWhere((element) => element == postId);
  }

  Future<void> saveUnsaveHandler(String postId) async {
    log('Save/Unsave-button pressed', name: 'HomeController');
    var dataList = await _readingListDB.query(
      'post_ids',
      columns: ['post_id'],
      where: 'post_id = ?',
      whereArgs: [postId],
    );
    dataList.length == 0
        ? await insertToDatabase({'post_id': postId})
        : await deleteFromDatabase(postId);
    !_readingList.contains(postId)
        ? insertToReadingList(postId)
        : deleteFromReadingList(postId);
    dataList = await _readingListDB.query('post_ids');
    print(dataList);
    print(_readingList);
  }

  @override
  void onInit() async {
    super.onInit();
    _readingListDB = await _initDataBase();
    var dataList = await _readingListDB.query('post_ids');
    log('The Database contains the data: $dataList',
        name: 'HomeController.onInit()');
    _readingList = dataList?.map((e) => e['post_id'].toString())?.toList()?.obs;
    log('The readingList contains the data: $readingList',
        name: 'HomeController.onInit()');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
